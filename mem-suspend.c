#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int
main(void)
{
	static const char *path = "/sys/power/state";
	int fd = open(path, O_WRONLY | O_TRUNC);

	if (fd == -1) {
		perror(path);
		return errno;
	}

	write(fd, "mem", 3);
	close(fd);
	return 0;
}
