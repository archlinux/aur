#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int collect_line(void);

int main(int argc, char **argv)
{
  int i, line_no;
  char tmp;

  if(argc < 2)
  {
    fprintf(stderr, "Must provide line number.\n");
    return EXIT_FAILURE;
  }

  i = 1;
  line_no = (int)atol(argv[1]);

  if(line_no < 1)
  {
    fprintf(stderr, "Must provide a positive line number.\n");
    return EXIT_FAILURE;
  }

  while(1)
  {
    if(i == line_no)
    {
      return collect_line();
    }

    tmp = getchar();
    if(tmp == EOF)
    {
      return EXIT_SUCCESS;
    }
    else if(tmp == '\n')
    {
      i++;
    }
  }

  return EXIT_SUCCESS;
}

int collect_line(void)
{
  char tmp;

  while(1)
  {
    tmp = getchar();
    if(tmp == EOF || tmp == '\n')
    {
      break;
    }

    write(STDOUT_FILENO, &tmp, sizeof(tmp));
  }

  return EXIT_SUCCESS;
}
