#include <stdio.h>
#include <stdlib.h>

#include <sys/ioctl.h>

int main()
{
  char shift_state;

  shift_state = 6;
  if (ioctl(0, TIOCLINUX, &shift_state) < 0) {
    perror("ioctl TIOCLINUX 6 (get shift state)");
    exit(1);
  }
  printf("%x\n", shift_state);
  return 0;
}
