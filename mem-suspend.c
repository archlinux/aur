#include <stdlib.h>
#include <stdio.h>
#include <errno.h>

static const char *state_path = "/sys/power/state";

int main(void)
{
  FILE *fp = fopen(state_path, "w");
  if (fp)
  {
    fputs("mem", fp);
  }
  else
  {
    perror(state_path);
    return errno;
  }
  return EXIT_SUCCESS;
}
