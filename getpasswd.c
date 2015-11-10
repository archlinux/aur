#include <stdio.h>
#include <stdlib.h>
#include <termios.h>

int main(){

    struct termios termold, termnew;
    tcgetattr(fileno(stdin), &termold);
    termnew = termold;
    termnew.c_lflag &= ~ECHO;
    termnew.c_cc[VINTR] = '\0';
    termnew.c_cc[VEOF] = '\0';
    termnew.c_cc[VKILL] = '\0';
    termnew.c_cc[VLNEXT] = '\0';
    termnew.c_cc[VQUIT] = '\0';
    termnew.c_cc[VSTART] = '\0';
    termnew.c_cc[VSTOP] = '\0';
    termnew.c_cc[VSUSP] = '\0';
    termnew.c_cc[VWERASE] = '\0';
    tcsetattr(fileno(stdin), TCSANOW, &termnew);

    char *line = NULL;
    size_t len = 0;
    size_t read;
    read = getline(&line, &len, stdin);

    tcsetattr(fileno(stdin), TCSANOW, &termold);

    printf("%.*s",(int)read-1,line);

    free(line);

    return 0;

}

/* Using getpass() - deprecated
 *
 * #include <stdio.h>
 * #include <unistd.h>
 *
 * int main(){
 *     char *passwd = getpass("");
 *     printf("%s",passwd);
 * }
 *
 */
