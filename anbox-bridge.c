#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>

int main(void)
{
	setuid(0);

	char buf[512];
	sprintf(buf, "/usr/lib/anbox/anbox-bridge.sh %s", "start");
	system((char *)buf);
}
