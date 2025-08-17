#include <stdlib.h>

#include "ui.h"

int main(void)
{
	ui_init();
	ui_loop();
	ui_close();
    return EXIT_SUCCESS;
}
