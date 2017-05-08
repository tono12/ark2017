#include <stdio.h>

int F(const int n);
int M(const int n);
 
int F(const int n)
{
  if (n == 0)
    return 1;
  else
    return n - M(F(n - 1));
}
 
int M(const int n)
{
  if (n == 0)
    return 0;
  else
    return n - F(M(n - 1));
}

int max(int *v, int n)
{
  int max1, max2;
  
  if (n < 2)
    return v[0];
  
  max1 = max(v, n/2);
  max2 = max(v + n/2, n/2);
  
  if (max1 > max2)
    return max1;
  
  return max2;
}



int main() {  
  int i;
  int emes[10];
  int efes[10];

  for(i=0;i<10;i++){
    emes[i] = M(i);
    efes[i] = F(i);
  }
  printf("Emes = ");
  for(i=0;i<10;i++)
    printf("%i, ", emes[i]);
  printf("\nEfes = ");
  for(i=0;i<10;i++)
    printf("%i, ", efes[i]);
  printf("\n");
  return 0;
}
