// Runs Steam's i386 reaper as a 64-bit process, so launching a game needs no lib32;
// any other i386 program the binfmt_misc rule catches runs unchanged through the 32-bit loader.
// The reaper logic is Plagman/reaper (MIT, (c) 2020 Pierre-Loup A. Griffais).
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/prctl.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <unistd.h>
#include <zlib.h>

// STEAM_REAPER_SIZE and STEAM_REAPER_CRC32 identify the i386 reaper; the PKGBUILD passes them.
#define I386_LOADER "/usr/lib32/ld-linux.so.2"

// Checks whether path holds the exact i386 reaper this replaces.
static bool is_steam_reaper(const char *path) {
	int fd = open(path, O_RDONLY | O_CLOEXEC);
	if (fd == -1)
		return false;
	struct stat st;
	bool match = false;
	if (fstat(fd, &st) == 0 && st.st_size == STEAM_REAPER_SIZE) {
		void *bytes = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
		if (bytes != MAP_FAILED) {
			match = crc32(0, bytes, st.st_size) == STEAM_REAPER_CRC32;
			munmap(bytes, st.st_size);
		}
	}
	close(fd);
	return match;
}

// Runs the i386 program at path with its NULL-terminated argv, as the kernel would have;
// returns only on failure.
static void exec_i386(char *path, char **program_argv) {
	int argc = 0;
	while (program_argv[argc])
		argc++;
	char *argv[argc + 4];
	argv[0] = I386_LOADER;
	argv[1] = "--argv0";
	argv[2] = program_argv[0];
	argv[3] = path;
	memcpy(&argv[4], &program_argv[1], argc * sizeof *argv); // the args and their NULL
	execv(I386_LOADER, argv);
	fprintf(stderr, "reaper64: cannot run %s through " I386_LOADER ": %s\n", path, strerror(errno));
}

// Runs the command after "--" in the NULL-terminated argv and waits for it and every orphan
// it leaves; returns 1 when there is no such command or it cannot be started.
static int reap(char **argv) {
	int sub_command_argc = 0;
	for (int i = 0; argv[i]; i++) {
		if (strcmp("--", argv[i]) == 0 && argv[i + 1]) {
			sub_command_argc = i + 1;
			break;
		}
	}
	if (sub_command_argc == 0) {
		fprintf(stderr, "reaper: no sub-command!\n");
		return 1;
	}
	// (Don't Lose) The Children
	if (prctl(PR_SET_CHILD_SUBREAPER, 1, 0, 0, 0) == -1) {
		fprintf(stderr, "reaper: prctl() failed!\n");
		return 1;
	}
	pid_t pid = fork();
	if (pid == -1) {
		fprintf(stderr, "reaper: fork() failed!\n");
		return 1;
	}
	if (pid == 0)
		execvp(argv[sub_command_argc], &argv[sub_command_argc]);
	while (wait(NULL) != -1 || errno != ECHILD)
		;
	return 0;
}

// binfmt_misc with the P flag calls this as: reaper64 <program path> <its argv[0]> <its arguments>...
int main(int argc, char **argv) {
	if (argc < 3) {
		fprintf(stderr, "reaper64: expects to be run by binfmt_misc with the P flag\n");
		return 1;
	}
	char *program = argv[1];
	char **program_argv = &argv[2];
	if (is_steam_reaper(program))
		return reap(program_argv);
	exec_i386(program, program_argv);
	return 127;
}
