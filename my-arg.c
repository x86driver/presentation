#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
	int num = atoi(argv[1]);
	num += 10;
	printf("%d\n", num);
	return 0;
}


