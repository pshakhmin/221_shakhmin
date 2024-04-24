#include <stdio.h>
#include <stdlib.h>

void swap(int *x, int *y) {
  *x = *x ^ *y;
  *y = *x ^ *y;
  *x = *x ^ *y;
}

int main() {
  // inputs an integer value ‘N’;
  int n;
  scanf("%d", &n);

  // allocates an array of ‘N’ integer elements;
  int *arr = malloc(n * sizeof(int));
  int *start = arr, *end = arr + n - 1;

  // fills the array with integer values from the standard input;
  while (start <= end)
    scanf("%d", start++);

  // reverses the array;
  start = arr;
  while (start < end) {
    swap(start, end);
    start++;
    end--;
  }

  // prints the resulting array;
  printf("\n");
  start = arr;
  end = arr + n;
  while (start < end)
    printf("%d\n", *start++);

  // dellocates the array.
  free(arr);
  return 0;
}
