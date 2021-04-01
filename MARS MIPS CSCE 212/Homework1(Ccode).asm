#include <stdio.h>
int main() {
	int i = 0;
	int j = 0;
	printf("Enter two integers: ");
	scanf("%d %d", &i, &j);
	printf("First number: %d\n Second number: %d\n", i, j);
	int k = i | j;
	int l = i & j;
	int m = i ^ j;
	printf("%d | %d = %d\n", i,j,k);
	printf("%d & %d = %d\n", i,j,l);
	printf("%d ^ %d = %d\n", i,j,m);
	int n = i << 1;
	int o = i >> 1;
	int p = ~i;
	int q = j << 1;
	int r = j  >> 1;
	int s = ~j;
	printf("%d << 1 = %d\n", i,n);
	printf("%d >> 1 = %d\n", i,o);
	printf("~%d = %d\n", i,p);
	printf("%d << 1 = %d\n", j,q);
	printf("%d >> 1 = %d\n", j,r);
	printf("~%d = %d\n", j,s);
return 0;
	
}