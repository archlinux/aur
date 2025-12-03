#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>
#include <sys/wait.h>
#include <curl/curl.h>
#include "cjson/cJSON.h"

struct buffer {
    char *data;
    size_t len;
};

static size_t write_cb(void *ptr, size_t size, size_t nmemb, void *userdata) {
    struct buffer *buf = userdata;
    size_t total = size * nmemb;
    buf->data = realloc(buf->data, buf->len + total + 1);
    memcpy(buf->data + buf->len, ptr, total);
    buf->len += total;
    buf->data[buf->len] = 0;
    return total;
}

int run_cmd(char *argv[]) {
    pid_t pid = fork();
    if (pid == 0) {
        execvp(argv[0], argv);
        perror("execvp");
        exit(127);
    }
    int status;
    waitpid(pid, &status, 0);
    return WEXITSTATUS(status);
}

char *aur_get_git_url(const char *pkgname) {
    struct buffer buf = {0};
    CURL *curl = curl_easy_init();
    if (!curl) return NULL;

    char url[256];
    snprintf(url, sizeof(url),
        "https://aur.archlinux.org/rpc/?v=5&type=info&arg=%s", pkgname);

    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_cb);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &buf);
    curl_easy_perform(curl);
    curl_easy_cleanup(curl);

    cJSON *root = cJSON_Parse(buf.data);
    if (!root) return NULL;

    char *git_url = malloc(256);
    snprintf(git_url, 256, "https://aur.archlinux.org/%s.git", pkgname);

    cJSON_Delete(root);
    free(buf.data);
    return git_url;
}

int install_pkg(const char *pkg) {
    char *git_url = aur_get_git_url(pkg);
    if (!git_url) return 1;

    char *git_cmd[] = {"git", "clone", git_url, (char *)pkg, NULL};
    if (run_cmd(git_cmd) != 0) return 1;

    chdir(pkg);

    char *makepkg_cmd[] = {"makepkg", "-si", "--noconfirm", NULL};
    int r = run_cmd(makepkg_cmd);

    return r;
}

int remove_pkg(const char *pkg) {
    char *pacman_cmd[] = {"sudo", "pacman", "-Rns", "--noconfirm", (char *)pkg, NULL};
    return run_cmd(pacman_cmd);
}

void print_usage() {
    printf("gab - AUR helper\n");
    printf("Usage:\n");
    printf("  gab -S <pkgname>\n");
    printf("  gab -R <pkgname>\n");
}

int main(int argc, char **argv) {
    if (argc < 2) {
        print_usage();
        return 0;
    }

    int opt;
    while ((opt = getopt(argc, argv, "S:R:")) != -1) {
        switch (opt) {
            case 'S':
                return install_pkg(optarg);
            case 'R':
                return remove_pkg(optarg);
            default:
                print_usage();
                return 1;
        }
    }

    print_usage();
    return 0;
}
