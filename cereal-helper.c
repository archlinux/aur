#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define PATH_SIZE 4096

void usage(void) {
    printf("cereal-helper -- AUR helper\n\n");
    printf("Usage:\n");
    printf("  cereal-helper  install <aur-package>\n");
    printf("  cereal-helper  remove <aur-package>\n");
}

int run_command(char *const argv[]) {
  pid_t pid = fork();
    if (pid == 0) {
        execvp(argv[0], argv);
        perror("execvp failed");
        exit(1);
    } else if (pid < 0) {
        perror("fork failed");
        return 1;
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status)) return WEXITSTATUS(status);
        return 1;
    }
}

int install_aur(const char *pkg) {
    char path[PATH_SIZE];
    snprintf(path, PATH_SIZE, "/tmp/%s", pkg);

    char *rm_cmd[] = {"rm", "-rf", path, NULL};
    if (run_command(rm_cmd)) return 1;

    char url[PATH_SIZE];
    snprintf(url, PATH_SIZE, "https://aur.archlinux.org/%s.git", pkg);
    char *git_cmd[] = {"git", "clone", url, path, NULL};
    if (run_command(git_cmd)) return 1;

    char *makepkg_cmd[] = {"makepkg", "-si", "--noconfirm", NULL};
    pid_t pid = fork();
    if (pid == 0) {
        chdir(path);
        execvp(makepkg_cmd[0], makepkg_cmd);
        perror("execvp failed");
        exit(1);
    } else if (pid < 0) {
        perror("fork failed");
        return 1;
    } else {
        int status;
        waitpid(pid, &status, 0);
        if (WIFEXITED(status)) return WEXITSTATUS(status);
        return 1;
    }
}

int remove_pkg(const char *pkg) {
    char *cmd[] = {"sudo", "pacman", "-Rns", pkg, "--noconfirm", NULL};
    return run_command(cmd);
}

int main(int argc, char *argv[]) {
    if (argc < 3) {
        usage();
        return 1;
    }

    if (strcmp(argv[1], "install") == 0) {
        return install_aur(argv[2]);
    } else if (strcmp(argv[1], "remove") == 0) {
        return remove_pkg(argv[2]);
    }

    usage();
    return 1;
}

