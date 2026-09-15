#include <unistd.h>

int main(void)
{
	return getpid() > 0 ? 0 : 1;
}
