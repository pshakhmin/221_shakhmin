#include <stdio.h>
#include <stdlib.h>

// creates a singly-linked list;
struct Node {
  int data;
  struct Node *next;
};

int main() {
  struct Node *head = malloc(sizeof(struct Node));
  struct Node *ptr = head;

  // add to the list numbers from the standard input until user inputs 0;
  while (1) {
    int x;
    scanf("%d", &x);
    if (x == 0)
      break;

    ptr->next = malloc(sizeof(struct Node));
    ptr->next->data = x;
    ptr->next->next = NULL;

    ptr = ptr->next;
  }

  // reverses the list;
  // head -> 1 -> 2 -> 3 -> 4 -> 5 -> NULL
  // NULL <- 1 <- 2 <- 3 <- 4 <- 5 <- head
  struct Node *cur = head->next, *prev = NULL, *next = NULL;
  while (cur != NULL) {
    next = cur->next;
    cur->next = prev;
    prev = cur;
    cur = next;
  }
  head = prev;

  // prints the resulting list;
  printf("\n");
  for (struct Node *node = head; node != NULL; node = node->next)
    printf("%d\n", node->data);

  // deallocates the list.
  while (head != NULL) {
    struct Node *tmp = head;
    head = head->next;
    free(tmp);
  }
  return 0;
}
