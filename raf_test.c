#include "raf.h"

#include <stdio.h>

int main(void) {
	printf("true color:\n");
	raf(true);
	printf("\nansi:\n");
	raf(false);
}
