/* Copyright 2017 Maxwell Anselm.
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation, either version 3 of the License, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program.  If not, see <http://www.gnu.org/licenses/>.
 */
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

	// silence output
	if (!freopen("/dev/null", "w", stdout)) fprintf(stdout, "Failed to silence stdout\n");
	if (!freopen("/dev/null", "w", stderr)) fprintf(stderr, "Failed to silence stderr\n");

	// run the command
	execvp(argv[1], argv + 1);

	// if execvp returns, it's an error
	if (freopen("/dev/tty", "w", stderr)) perror(argv[0]);

	return 1;
}
