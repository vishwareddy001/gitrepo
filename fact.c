#include <stdio.h>
 
int fact()
{

  int c, n, fact = 1;

 
  printf("Enter a num to calculate factorial\n");
  scanf("%d", &n);
 
  for (c = 1; c <= n; c++)
    fact = fact * c;
 
  printf("Factorial of %d = %d\n", n, fact);
 
  return 0;
}
