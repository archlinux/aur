#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>

static const char *state_path = "/sys/power/state";

int main(void)
{
  int fd = open(state_path, O_WRONLY | O_TRUNC);
  if (fd != -1)
  {
    write(fd, "mem", 3);
  }
  else
  {
    perror(state_path);
    return errno;
  }
  return 0;
}
