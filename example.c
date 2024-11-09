#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>

#include "smaz2.h"

#define BUF_SIZE 4096

int main(int argc, char **argv) {
  int decompress = 0, trace = 0;
  char opt; // man getopt.3
  extern char *optarg;
  while ( (opt = getopt(argc, argv, "hdv")) != -1) {
    switch (opt) {
      case 'h':
        fprintf(stderr, "Usage:\n"
          "%s [-hdvl]\n"
          "-d - Decompress\n"
          "-h - Print this help\n"
          "-v - Be one level more verbose\n"
          , argv[0]);
        exit(0);
        break;
      case 'd':
        decompress = 1;
        break;
      case 'v':
        trace++;
        break;
      default:
        fprintf(stderr, "invalid option -%c\n", opt);
    }
  }

  unsigned char ibuf[BUF_SIZE], obuf[BUF_SIZE*3];
  while (1) {
    ssize_t numRead = read(0, ibuf, sizeof(ibuf) / sizeof(char));
    if (trace) fprintf(stderr, "read %liB\n", numRead);
    if (numRead == -1) {
      perror("read");
      exit(EXIT_FAILURE);
    }
    if (numRead == 0) break;

    int numOut = decompress
     ? smaz2_decompress(obuf, sizeof(obuf)/sizeof(char), ibuf, numRead)
     : smaz2_compress  (obuf, sizeof(obuf)/sizeof(char), ibuf, numRead)
    ;

    if (write(1, obuf, numOut) != numOut) {
      perror("write - partial/failed write");
      exit(EXIT_FAILURE);
    }
    if (trace) fprintf(stderr, "wrote %iB\n", numOut);
  }
}
