#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int main(int argc, char** argv)
{
	// need a command to run
	if (argc <= 1) return 1;

	// fork to disown the child
	pid_t child;
	if (child = fork())
	{
		if (child == -1)
		{
			perror("fork");
			return 1;
		}

		printf("%ld\n", (long)child);
		return 0;
	}

	// swallow the leading arg and put a NULL at the end
	for (int i = 0; i < argc - 1; ++i)
		argv[i] = argv[i + 1];
	argv[argc - 1] = NULL;

	// silence output
	if (!freopen("/dev/null", "w", stdout)) fprintf(stdout, "Failed to silence stdout\n");
	if (!freopen("/dev/null", "w", stderr)) fprintf(stderr, "Failed to silence stderr\n");

	// run the command
	if (execvp(argv[0], argv))
	{
		if (freopen("/dev/tty", "w", stderr)) perror(argv[0]);
	}

	return 1;
}
