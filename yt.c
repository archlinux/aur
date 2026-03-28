// The MIT License (MIT)
// Copyright © 2026 Yalçın Mete Kızılgün

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#include <security/pam_appl.h>
#include <security/pam_misc.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>
#include <locale.h>
#include <sys/stat.h>
#include <errno.h>
#include <termios.h>

#define CONFIG_FILE "/etc/yt.cfg"
#define ONEPASS_DIR "/tmp/yt_onepass"

// Terminalde görünmez şifre okuma
void read_password(char *buf, size_t size, const char *prompt) {
    struct termios oldt, newt;
    printf("%s", prompt);
    fflush(stdout);

    tcgetattr(fileno(stdin), &oldt);
    newt = oldt;
    newt.c_lflag &= ~ECHO;
    tcsetattr(fileno(stdin), TCSANOW, &newt);

    if (!fgets(buf, size, stdin)) buf[0] = 0;
    buf[strcspn(buf, "\n")] = 0;

    tcsetattr(fileno(stdin), TCSANOW, &oldt);
    printf("\n");
}

// Custom PAM conversation function
static int my_conv(int num_msg, const struct pam_message **msg,
                   struct pam_response **resp, void *appdata_ptr) {
    struct pam_response *aresp;
    if (num_msg <= 0) return PAM_CONV_ERR;

    aresp = calloc(num_msg, sizeof(struct pam_response));
    if (!aresp) return PAM_CONV_ERR;

    const char *username = (const char *)appdata_ptr;

    for (int i = 0; i < num_msg; i++) {
        if (msg[i]->msg_style == PAM_PROMPT_ECHO_OFF) {
            char input[128];
            char prompt[256];
            snprintf(prompt, sizeof(prompt), "[yt] password for %s: ", username);
            read_password(input, sizeof(input), prompt);
            aresp[i].resp = strdup(input);
            aresp[i].resp_retcode = 0;
        }
    }
    *resp = aresp;
    return PAM_SUCCESS;
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL, "");
    setenv("PATH", "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", 1);

    if (argc < 2) {
        fprintf(stderr, "Usage: yt </full/path/command> [parameters]\n");
        return 1;
    }

    struct passwd *pw = getpwuid(getuid());
    if (!pw) return 1;

    int nopass = 0, onepass = 0;
    int config_found = 0;

    FILE *file = fopen(CONFIG_FILE, "r");
    if (file) {
        char line[256], user[64], mode[16];
        while (fgets(line, sizeof(line), file)) {
            if (line[0] == '#' || line[0] == '\n') continue;
            if (sscanf(line, " %63[^:]:%15s", user, mode) == 2) {
                if (strcmp(user, pw->pw_name) == 0) {
                    config_found = 1;
                    if (strcmp(mode, "nopass") == 0) nopass = 1;
                    else if (strcmp(mode, "onepass") == 0) onepass = 1;
                    else nopass = 0; // pass
                    break;
                }
            }
        }
        fclose(file);
    }

    if (!config_found) {
        struct group *gr = getgrnam("wheel");
        if (gr) {
            for (int i = 0; gr->gr_mem[i] != NULL; i++) {
                if (strcmp(gr->gr_mem[i], pw->pw_name) == 0) {
                    nopass = 0;
                    config_found = 1;
                    break;
                }
            }
        }
    }

    char flag_path[512];
    if (onepass) {
        if (mkdir(ONEPASS_DIR, 0700) < 0 && errno != EEXIST) {
            perror("Error: Onepass directory could not be created");
            return 1;
        }
        if (snprintf(flag_path, sizeof(flag_path), "%s/%s", ONEPASS_DIR, pw->pw_name) >= (int)sizeof(flag_path)) {
            fprintf(stderr, "Error: flag_path is too long\n");
            return 1;
        }
        struct stat st;
        if (stat(flag_path, &st) == 0) nopass = 1;
    }

    pam_handle_t *pamh = NULL;
    struct pam_conv conv = { my_conv, (void *)pw->pw_name };
    int retval = 0;

    if (!nopass) {
        retval = pam_start("yt", pw->pw_name, &conv, &pamh);
        if (retval != PAM_SUCCESS) goto pam_fail;

        retval = pam_authenticate(pamh, 0);
        if (retval != PAM_SUCCESS) goto pam_fail;

        retval = pam_acct_mgmt(pamh, 0);
        if (retval != PAM_SUCCESS) goto pam_fail;

        pam_end(pamh, PAM_SUCCESS);
        pamh = NULL;

        if (onepass) {
            FILE *f = fopen(flag_path, "w");
            if (f) fclose(f);
        }
    }

    if (setgid(0) != 0 || setuid(0) != 0) {
        perror("Error: Privilege elevation failed (Check SUID bit)");
        return 1;
   

    if (execvp(argv[1], &argv[1]) == -1) {
        perror("Error: The command could not be executed");
        return 1;
    }

    return 0;

pam_fail:
    fprintf(stderr, "\n[yt] Error: %s\n", pam_strerror(pamh, retval));
    if (pamh != NULL) pam_end(pamh, retval);
    return 1;

