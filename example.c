#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>
#include <string.h>

#include "smaz2.h"
int debug = 0;

#define BUF_SIZE 4096
#define SAVE_SIZE 14  // 3 + max strlen in words[]

int main(int argc, char **argv) {
  int decompress = 0, trace = 0, sure = 0;
  char opt; // man getopt.3
  extern char *optarg;
  static const char *const opts="hdvf";
  while ( (opt = getopt(argc, argv, opts)) != -1) {
    switch (opt) {
      case 'h':
        fprintf(stderr, "Compress or decompress smaz2, stdin to stdout.\n"
          "Usage:\n"
          "%s [-%s]\n"
          "-d - Decompress\n"
          "-h - Print this help\n"
          "-v - Be one level more verbose\n"
          "-f - read/write compressed data from/to a TTY\n"
          "Return codes:\n"
          "0 - success\n"
          "1 - internal error or malformed input\n"
          "2 - read error\n"
          "3 - write error\n"
          "4 - compressed data to/from TTY without -f\n"
          , argv[0], opts);
        exit(0);
        break;
      case 'd':
        decompress = 1;
        break;
      case 'v':
        trace ++;
        debug = trace>1;
        break;
      case 'f':
        sure = 1;
        break;
      default:
        fprintf(stderr, "invalid option -%c\n", opt);
    }
  }

  if (!sure && isatty(decompress?0:1)) {
    fprintf(stderr, "warning: %s connected to TTY\n(pass -f to ignore)\n",decompress?"stdin":"stdout");
    exit(4);
  }

  unsigned char ibuf[BUF_SIZE+SAVE_SIZE], obuf[BUF_SIZE*3];
  unsigned char sbuf[SAVE_SIZE]; int save = 0;
  while (1) {
    if (save) memcpy(ibuf,sbuf,save);
    ssize_t numRead = read(0, ibuf+save, BUF_SIZE); // sizeof(char) === 1
    if (trace) fprintf(stderr, "read %liB", numRead);
    if (trace && save) fprintf(stderr, ", plus last %iB of previous buffer\n", save);
    if (trace &&!save) fprintf(stderr, "\n");
    if (numRead == -1) {
      perror("read");
      exit(2);
    }
    int end = save && !numRead;
    numRead += save;
    save = 0;
    if (!numRead) break;

    if (!end){ if (decompress) {
      // check for end malformation/incomplete byte sequences
      // 80-ff: bigraphs
      // 01-05: verbatim, n chars
      // 06-08: word with maybe space, 1 char
      // otherwise (00,09-7f) verbatim
      save = 0;
      if(0){}
      else if (ibuf[numRead-5] == '\x05') save = 5;
      else if (ibuf[numRead-4] == '\x04') save = 4;
      else if (ibuf[numRead-3] == '\x03') save = 3;
      else if (ibuf[numRead-2] == '\x02') save = 2;
      else if (0
        || ibuf[numRead-1] == '\x01'
        || ibuf[numRead-1] == '\x06'
        || ibuf[numRead-1] == '\x07'
        || ibuf[numRead-1] == '\x08'
      ) save = 1;
    } else {
      // ideally, would check for cut words or digraphs
      // actually, just tries to keep the last few alphabet chars
      int i = numRead-1;
      while (i>=numRead-SAVE_SIZE && ibuf[i]>='a' && ibuf[i]<='z') i--;
      save = numRead-1 - i;
    } }
    ssize_t numIn = numRead - save;
    if (save) memcpy(sbuf, ibuf+numIn, save);
    if (save && trace) fprintf(stderr, "saved %iB; now %liB\n",save, numIn);

    ssize_t numOut = decompress
     ? smaz2_decompress(obuf, BUF_SIZE*2, ibuf, numIn)
     : smaz2_compress  (obuf, BUF_SIZE*2, ibuf, numIn)
    ;

    if (!numOut) {
      fprintf(stderr, "warning: malformed input or internal error\n");
      exit(1);
    }

    ssize_t numWrite = write(1, obuf, numOut);
    if (numWrite != numOut) {
      perror("write - partial/failed write");
      if (numWrite > 0) fprintf(stderr,"(wrote %liB)\n",numWrite);
      exit(3);
    }
    if (trace) fprintf(stderr, "wrote %liB (%.2f%%)\n", numOut, 100.0*numOut/numIn);
  }
  if (trace) fprintf(stderr, "closed\n");
}
