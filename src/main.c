#include <stdlib.h>
#include <stdio.h>

#include "ui.h"

int main(void)
{
	printf("Starting...\n");
	ui_init();
	ui_loop();
	ui_close();
    return EXIT_SUCCESS;
}
