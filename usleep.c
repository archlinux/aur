#include <stdlib.h>
#include <unistd.h>

int main(int argc, const char *argv[])
{
    if (argc < 2)
        return 0;

    unsigned int usecs = atoi(argv[1]);
    usleep(usecs);
    return 0;
}
