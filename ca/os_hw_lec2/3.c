#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
  *x = *x ^ *y;
  *y = *x ^ *y;
  *x = *x ^ *y;
}

int main() {
  // inputs two integer values N and M;
  int n, m;
  scanf("%d %d", &n, &m);

  // allocates a matrix of size N * M and fills it with values from standard
  // input;
  int *arr = malloc(n * m * sizeof(int));
  for (int i = 0; i < n; ++i)
    for (int j = 0; j < m; ++j)
      scanf("%d", arr + i + j * n);

  // transposes the matrix;
  for (int i = 0; i < n; ++i)
    for (int j = i + 1; j < m; ++j)
      swap(arr + i + j * n, arr + j + i * n);

  // prints the resulting matrix;
  printf("\n");
  for (int i = 0; i < n; ++i) {
    for (int j = 0; j < m; ++j)
      printf("%d ", *(arr + i + j * n));
    printf("\n");
  }

  // dellocates the array.
  free(arr);
  return 0;
}
