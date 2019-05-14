#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void step(char last, char curr)
{
  char tmp;

  if(curr == '\n')
  {
    /* check if the next char is a line spaces as well,
       if so don't do a damn thing! */

    tmp = getchar();

    if(tmp == EOF)
    {
      /* kind of whacky, lets just output the newline and exit I suppose. */
      putchar(curr);
      putchar(tmp);      
      return;
    }
    else if (tmp == '\n')
    {
      /* okay cool, just leave alone! */
      /* can prob combine w/ func above */
      putchar(curr);
      putchar(tmp);
      return;
    }
    else 
    {
      /* business as normal, here we don't want to put out the newline but we 
         also really don't want to put out two whitespace characters right
         next to each other. Reverse and make sure we're not! */

      /* set last, then check if last and tmp are both spaces, if so only
         write one! */

      /* Well, fuck. We cannot seek on standard input */

      if(last == ' ' && tmp == ' ')
      {
        /* no op */
      }
      else if(last != ' ' && tmp != ' ')
      {
        putchar(' ');
        putchar(tmp);
      }
      else
      {
        putchar(tmp);
      }
    }
  }
  else
  {
    putchar(curr);
  }
}

int main(void) 
{
  char last, curr;

  last = '\0';
  curr = getchar();

  while(curr != EOF)
  {
    step(last, curr);

    last = curr;
    curr = getchar();
  }

  return 0;
}
