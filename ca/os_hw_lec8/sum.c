#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>

static int sum = 0;
static pthread_mutex_t mtx = PTHREAD_MUTEX_INITIALIZER;

struct sum_args_struct {
  size_t start_pos;
  size_t end_pos;
  int *array;
};

void *thread_sum(void *args) {
  struct sum_args_struct *thread_args = (struct sum_args_struct *)args;

  size_t start_pos = thread_args->start_pos;
  size_t end_pos = thread_args->end_pos;
  int *array = thread_args->array;

  int internal_sum = 0;
  for (size_t i = start_pos; i < end_pos; ++i) {
    internal_sum += array[i];
  }

  pthread_mutex_lock(&mtx);
  sum += internal_sum;
  pthread_mutex_unlock(&mtx);
  return NULL;
}

int main(int argc, char *argv[]) {
  srand(time(NULL));

  size_t n;
  scanf("%zu", &n);
  int *array = malloc(sizeof(int) * n);

  for (size_t i = 0; i < n; ++i) {
    array[i] = rand() % 10;
    // printf("%d ", array[i]);
  }

  pthread_t tids[4];
  struct sum_args_struct args_list[4];
  int part_size = n / 4;

  for (int i = 0; i < 4; ++i) {
    args_list[i].start_pos = i * part_size;
    args_list[i].end_pos = (i + 1) * part_size;
    args_list[i].array = array;
    pthread_create(&tids[i], NULL, &thread_sum, (void *)&args_list[i]);
  }
  for (int i = 0; i < 4; ++i)
    pthread_join(tids[i], NULL);

  printf("\n%d", sum);
  return EXIT_SUCCESS;
}
