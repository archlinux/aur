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
#include <ctype.h>
#include <fcntl.h>

#define CONFIG_FILE "/etc/yt.cfg"
#define ONEPASS_DIR "/tmp/yt_onepass"

// --- Basit yerelleştirme (i18n) ---
// Harici .po/.mo dosyalarına ihtiyaç duymadan, sistem locale'ına
// (LC_ALL / LC_MESSAGES / LANG) bakarak TR/EN mesaj seçimi yapar.
typedef enum { LANG_EN = 0, LANG_TR } lang_t;
static lang_t g_lang = LANG_EN;

// Bir locale değerinin Türkçe olup olmadığını kontrol eder (örn. "tr_TR.UTF-8", "tr")
static int locale_is_turkish(const char *val) {
    if (!val || !val[0]) return 0;
    return (tolower((unsigned char)val[0]) == 't' && tolower((unsigned char)val[1]) == 'r');
}

// POSIX önceliğine göre (LC_ALL > LC_MESSAGES > LANG) dil tespiti yapar.
static void detect_language(void) {
    const char *vars[] = { "LC_ALL", "LC_MESSAGES", "LANG" };
    for (size_t i = 0; i < sizeof(vars) / sizeof(vars[0]); i++) {
        const char *val = getenv(vars[i]);
        if (val && val[0] && strcmp(val, "C") != 0 && strcmp(val, "POSIX") != 0) {
            g_lang = locale_is_turkish(val) ? LANG_TR : LANG_EN;
            return;
        }
    }
    g_lang = LANG_EN;
}

// Kullanım: MSG(ingilizce, türkçe)
#define MSG(en, tr) (g_lang == LANG_TR ? (tr) : (en))

// Hassas verileri (şifre vb.) bellekten siler. Derleyicinin bu yazmayı
// "gereksiz" diye elemesini önlemek için volatile işaretçi kullanılır.
static void secure_zero(void *buf, size_t len) {
    volatile unsigned char *p = (volatile unsigned char *)buf;
    while (len--) *p++ = 0;
}

// ONEPASS_DIR /tmp altında, tüm kullanıcıların erişebildiği öngörülebilir
// bir konum. Bu tür yerler klasik sembolik link / TOCTOU saldırılarının
// hedefidir: biri dizini root'tan önce oluşturup izinlerini gevşetebilir
// ya da bir symlink koyabilir. mkdir()'in EEXIST dönmesi dizinin güvenli
// olduğu anlamına gelmez; bu yüzden lstat ile gerçek sahibini, tipini ve
// izinlerini doğruluyoruz. Şüpheli görünürse dizine hiç dokunmadan
// (silmeye çalışmadan) reddediyoruz.
static int onepass_dir_is_safe(void) {
    if (mkdir(ONEPASS_DIR, 0700) < 0 && errno != EEXIST) return 0;

    struct stat st;
    if (lstat(ONEPASS_DIR, &st) != 0) return 0;
    if (!S_ISDIR(st.st_mode)) return 0;          // symlink veya başka bir şey olabilir
    if (st.st_uid != 0) return 0;                // root'a ait değil
    if (st.st_mode & (S_IWGRP | S_IWOTH)) return 0; // grup/diğerleri yazabiliyor
    return 1;
}

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
            snprintf(prompt, sizeof(prompt),
                     MSG("[yt] Password verification for %s: ",
                         "[yt] %s için şifre doğrulama: "),
                     username);
            read_password(input, sizeof(input), prompt);
            aresp[i].resp = strdup(input);
            secure_zero(input, sizeof(input));
            if (!aresp[i].resp) {
                for (int j = 0; j < i; j++) {
                    if (aresp[j].resp) {
                        secure_zero(aresp[j].resp, strlen(aresp[j].resp));
                        free(aresp[j].resp);
                    }
                }
                free(aresp);
                return PAM_CONV_ERR;
            }
            aresp[i].resp_retcode = 0;
        }
    }
    *resp = aresp;
    return PAM_SUCCESS;
}

int main(int argc, char *argv[]) {
    setlocale(LC_ALL, "");
    detect_language();
    setenv("PATH", "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin", 1);

    if (argc < 2) {
        fprintf(stderr, "%s", MSG("Usage: yt </full/path/to/command> [parameters]\n",
                                   "Kullanım: yt </tam/yol/komut> [parametreler]\n"));
        return 1;
    }

    // Komut mutlak yol olmalı: aksi halde execvp, (sanitize edilmiş olsa da)
    // PATH araması yapar ve kullanıcının bulunduğu dizine göre belirsizlik
    // doğar. Belgelenen kullanım şekli zaten "tam yol" istiyor; bunu koda
    // da uygula.
    if (argv[1][0] != '/') {
        fprintf(stderr, "%s", MSG("Error: command must be an absolute path\n",
                                   "Hata: komut mutlak (tam) bir yol olmalı\n"));
        return 1;
    }

    struct passwd *pw = getpwuid(getuid());
    if (!pw) return 1;

    int nopass = 0, onepass = 0;
    int config_found = 0;

    FILE *file = fopen(CONFIG_FILE, "r");
    if (file) {
        // Dosyayı zaten açtıktan sonra fd üzerinden fstat yapıyoruz (path
        // üzerinden stat yapmak TOCTOU'ya açık olurdu). Root'a ait olmayan
        // veya grup/diğerleri tarafından yazılabilir bir config dosyasına
        // güvenmiyoruz: biri onu değiştirip kendine "nopass" tanımlayabilir.
        struct stat cst;
        if (fstat(fileno(file), &cst) == 0 &&
            cst.st_uid == 0 &&
            !(cst.st_mode & (S_IWGRP | S_IWOTH))) {
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
        } else {
            fprintf(stderr, "%s",
                    MSG("Warning: /etc/yt.cfg has unsafe ownership/permissions, ignoring it\n",
                        "Uyarı: /etc/yt.cfg sahiplik/izinleri güvensiz, yok sayılıyor\n"));
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
        if (!onepass_dir_is_safe()) {
            fprintf(stderr, "%s",
                    MSG("Error: " ONEPASS_DIR " has unsafe ownership/permissions, refusing onepass\n",
                        "Hata: " ONEPASS_DIR " sahiplik/izinleri güvensiz, onepass reddedildi\n"));
            return 1;
        }
        if (snprintf(flag_path, sizeof(flag_path), "%s/%s", ONEPASS_DIR, pw->pw_name) >= (int)sizeof(flag_path)) {
            fprintf(stderr, "%s", MSG("Error: flag_path is too long\n",
                                       "Hata: flag_path çok uzun\n"));
            return 1;
        }
        // lstat (stat değil): flag_path bir symlink ise takip etmeden
        // tespit ediyoruz; aksi halde biri kendi kullanıcı adına symlink
        // koyup rastgele bir dosyanın "var" görünmesini sağlayabilirdi.
        struct stat st;
        if (lstat(flag_path, &st) == 0 && S_ISREG(st.st_mode) && st.st_uid == 0) {
            nopass = 1;
        }
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
            // O_NOFOLLOW: flag_path bir symlink ise açmayı reddet (root
            // olarak keyfi bir dosyaya yazmayı önler). Başarısız olursa
            // sessizce devam ediyoruz; tek etkisi bir sonraki çalıştırmada
            // yine şifre sorulması olur, güvenlik açısından fail-safe'dir.
            int fd = open(flag_path, O_CREAT | O_WRONLY | O_TRUNC | O_NOFOLLOW, 0600);
            if (fd >= 0) close(fd);
        }
    }

    if (setgid(0) != 0 || setuid(0) != 0) {
        perror(MSG("Error: Failed to elevate privileges (check the SUID bit)",
                   "Hata: Yetki yükseltilemedi (SUID bitini kontrol edin)"));
        return 1;
    }

    if (execvp(argv[1], &argv[1]) == -1) {
        perror(MSG("Error: Command execution failed",
                   "Hata: Komut çalıştırılamadı"));
        return 1;
    }

    return 0;

pam_fail:
    fprintf(stderr, "\n[yt] %s %s\n", MSG("Error:", "Hata:"), pam_strerror(pamh, retval));
    if (pamh != NULL) pam_end(pamh, retval);
    return 1;
}
