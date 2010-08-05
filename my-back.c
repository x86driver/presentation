#include <stdio.h>

void third()
{
	printf("%s\n", __FUNCTION__);
}

void second()
{
	third();
}

void first()
{
	second();
}

int main()
{
	first();
	return 0;
}

