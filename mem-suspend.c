#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

int
main(void)
{
	static const char *path = "/sys/power/state";
	int fd = open(path, O_WRONLY | O_TRUNC);

	if (fd != -1) {
		write(fd, "mem", 3);
		close(fd);
	} else {
		perror(path);
		return errno;
	}

	return 0;
}
