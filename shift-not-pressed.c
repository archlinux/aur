#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <getopt.h>
#include <string.h>
#include <strings.h>

int main(int argc, char **argv)
{
  char shift_state;
  const char* usage =
    "Usage: shift-not-pressed [--help]\n\n"
    "exit codes:\n"
    "  0 (succes) shift was not pressed\n"
    "  1 (succes) shift was pressed\n"
    "  2 (fail)   could not get shift state\n";

  static struct option lopts[] = {
    {"help", no_argument, NULL, 'h'}
   };
  int c;
  while (1) {
    int opti;
    c = getopt_long(argc, argv, "h", lopts, &opti);
    if (c == -1) {
      break;
    }
    switch (c) {
      case 'h': fprintf(stdout, "%s", usage);
                exit(0);
                break;
      default: break;
    }
  }

  shift_state = 6;
  if (ioctl(0, TIOCLINUX, &shift_state) < 0) {
    perror("ioctl TIOCLINUX 6 (get shift state)");
    exit(2);
  }
  exit(shift_state);
}
