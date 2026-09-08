// The MIT License (MIT)
// Copyright © 2026 Yalçın Mete Kızılgün

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
// EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// fexecve() POSIX.1-2008'de tanımlı; glibc'nin unistd.h'de bunu
// göstermesi için ilgili özellik makrosunu, başka hiçbir sistem başlığı
// include edilmeden önce tanımlıyoruz.
#define _POSIX_C_SOURCE 200809L

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
#include <sys/types.h>
#include <errno.h>
#include <termios.h>
#include <ctype.h>
#include <fcntl.h>

extern char **environ;

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

// Kullanıcı belirtilen grubun üyesi mi? (config dosyasındaki "wheel:onepass"
// gibi satırların grup adıyla da eşleşebilmesi için)
static int user_in_group(const char *groupname, const char *username) {
    struct group *gr = getgrnam(groupname);
    if (!gr) return 0;
    for (int i = 0; gr->gr_mem[i] != NULL; i++) {
        if (strcmp(gr->gr_mem[i], username) == 0) return 1;
    }
    return 0;
}

// Mutlak yol dayatmasını korurken, çıplak bir komut adı (örn. "pacman")
// verildiğinde bunu sıralı, sabit bir aday listesinde arar:
//   1. /usr/bin        (root'a ait olmalı)
//   2. /usr/local/bin   (root'a ait olmalı)
//   3. <invoking_user_home>/.local/bin (çalıştıran kullanıcıya ait olmalı)
//
// Bu execvp'nin kullanıcının PATH ortam değişkenine göre arama yapmasından
// farklıdır — adaylar burada açıkça, sabit dizinlerle sınırlı olarak
// belirleniyor, PATH'e güvenilmiyor.
//
// Güvenlik: sadece "var mı" diye bakıp sonra ayrı bir execvp() çağrısı
// yapmak, ikisi arasında bir TOCTOU penceresi bırakır (biri dosyayı bir
// symlink'e çevirebilir). Bunu kapatmak için: her aday O_NOFOLLOW ile
// açılır, aynı fd üzerinde fstat ile doğrulanır (gerçek dosya mı, doğru
// sahipte mi, grup/diğerleri yazabiliyor mu), ve sonunda *tam olarak o
// doğrulanmış fd* fexecve() ile çalıştırılır — yol yeniden aranmaz, o
// yüzden doğrulama ile çalıştırma arasında dosyanın değiştirilmesi işe
// yaramaz.
//
// ~/.local/bin, çalıştıran kullanıcının kendi yazabildiği bir dizindir.
// Buradan bir ikili, kimlik doğrulamadan sonra root olarak çalıştırılacağı
// için, sahiplik kontrolünü "root" değil "çalıştıran kullanıcı" olarak
// uyguluyoruz — böylece başka bir kullanıcının (aynı ada sahip, örn. ortak
// bir /home bağlı diskte) dosyası sessizce kabul edilmez.

// Verilen path'i O_NOFOLLOW ile açar ve fd üzerinde doğrular:
// - gerçek bir dosya olmalı (symlink/aygıt/FIFO değil)
// - sahibi expected_uid olmalı
// - grup/diğerleri tarafından yazılabilir olmamalı
// - en azından bir çalıştırma bitine sahip olmalı
// Başarılıysa açık fd'yi döner (çağıran kapatmalı); değilse -1 döner ve
// açtığı fd'yi (varsa) kendisi kapatır.
static int open_verified_candidate(const char *path, uid_t expected_uid) {
    int fd = open(path, O_RDONLY | O_NOFOLLOW);
    if (fd < 0) return -1;

    struct stat st;
    if (fstat(fd, &st) != 0) { close(fd); return -1; }
    if (!S_ISREG(st.st_mode)) { close(fd); return -1; }
    if (st.st_uid != expected_uid) { close(fd); return -1; }
    if (st.st_mode & (S_IWGRP | S_IWOTH)) { close(fd); return -1; }
    if (!(st.st_mode & (S_IXUSR | S_IXGRP | S_IXOTH))) { close(fd); return -1; }

    return fd;
}

// ~/.local/bin dizininin kendisini, ONEPASS_DIR için yapılan kontrolle
// aynı ruhta doğrular: gerçek bir dizin olmalı (symlink değil), çalıştıran
// kullanıcıya ait olmalı, grup/diğerleri tarafından yazılabilir olmamalı.
// Dizin hiç yoksa (en yaygın durum) sessizce "güvenli değil/kullanılamaz"
// olarak dönülür; bu bir hata değildir, sadece 3. aday atlanır.
static int local_bin_dir_is_safe(const char *dir, uid_t expected_uid) {
    struct stat st;
    if (lstat(dir, &st) != 0) return 0;
    if (!S_ISDIR(st.st_mode)) return 0;
    if (st.st_uid != expected_uid) return 0;
    if (st.st_mode & (S_IWGRP | S_IWOTH)) return 0;
    return 1;
}

// Çıplak bir komut adını sırayla aday dizinlerde arar ve ilk doğrulamayı
// geçen adayın açık, doğrulanmış fd'sini döner (-1 = hiçbiri bulunamadı/
// doğrulanamadı). `home`, çalıştıran kullanıcının ev dizinidir (NULL/boş
// ise 3. aday atlanır). Reddedilen her aday için kısa bir uyarı basılır ki
// "neden bulunamadı" belirsiz kalmasın.
static int resolve_and_open_command(const char *name, const char *home, uid_t self_uid) {
    char path[512];
    int n;

    n = snprintf(path, sizeof(path), "/usr/bin/%s", name);
    if (n > 0 && n < (int)sizeof(path)) {
        int fd = open_verified_candidate(path, 0);
        if (fd >= 0) return fd;
        if (errno != ENOENT) {
            fprintf(stderr, "%s",
                    MSG("Warning: /usr/bin candidate failed integrity checks, skipping\n",
                        "Uyarı: /usr/bin adayı bütünlük kontrolünü geçemedi, atlanıyor\n"));
        }
    }

    n = snprintf(path, sizeof(path), "/usr/local/bin/%s", name);
    if (n > 0 && n < (int)sizeof(path)) {
        int fd = open_verified_candidate(path, 0);
        if (fd >= 0) return fd;
        if (errno != ENOENT) {
            fprintf(stderr, "%s",
                    MSG("Warning: /usr/local/bin candidate failed integrity checks, skipping\n",
                        "Uyarı: /usr/local/bin adayı bütünlük kontrolünü geçemedi, atlanıyor\n"));
        }
    }

    if (home && home[0]) {
        char local_bin_dir[512];
        int nd = snprintf(local_bin_dir, sizeof(local_bin_dir), "%s/.local/bin", home);
        if (nd > 0 && nd < (int)sizeof(local_bin_dir) && local_bin_dir_is_safe(local_bin_dir, self_uid)) {
            n = snprintf(path, sizeof(path), "%s/%s", local_bin_dir, name);
            if (n > 0 && n < (int)sizeof(path)) {
                int fd = open_verified_candidate(path, self_uid);
                if (fd >= 0) return fd;
                if (errno != ENOENT) {
                    fprintf(stderr, "%s",
                            MSG("Warning: ~/.local/bin candidate failed integrity checks, skipping\n",
                                "Uyarı: ~/.local/bin adayı bütünlük kontrolünü geçemedi, atlanıyor\n"));
                }
            }
        }
    }

    return -1;
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

    struct passwd *pw = getpwuid(getuid());
    if (!pw) return 1;

    // Komut ya mutlak bir yol olmalı, ya da sabit aday dizinlerinde
    // (/usr/bin, /usr/local/bin, ~/.local/bin) aranıp bulunabilmeli.
    // Çıplak bir ad execvp'ye PATH araması için bırakılmıyor (kullanıcının
    // bulunduğu dizine göre belirsizlik doğurur); bunun yerine burada,
    // sabit dizinlerle sınırlı ve sahiplik/izin doğrulamalı olarak açıkça
    // çözümleniyor. Mutlak yol verilmişse (dokümante edilen asıl kullanım
    // şekli) davranış değişmiyor: execvp ile doğrudan çalıştırılıyor, ek
    // bir sahiplik kısıtlaması getirilmiyor.
    int resolved_fd = -1;

    if (argv[1][0] != '/') {
        resolved_fd = resolve_and_open_command(argv[1], pw->pw_dir, pw->pw_uid);
        if (resolved_fd < 0) {
            fprintf(stderr, "%s",
                    MSG("Error: command not found in /usr/bin, /usr/local/bin or ~/.local/bin\n",
                        "Hata: komut /usr/bin, /usr/local/bin veya ~/.local/bin altında bulunamadı\n"));
            return 1;
        }
    }

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
                    // "user" alanı ya birebir kullanıcı adı ya da bir grup
                    // adı olabilir (README ve yt.cfg'nin vaat ettiği gibi,
                    // örn. varsayılan "wheel:onepass" satırı).
                    if (strcmp(user, pw->pw_name) == 0 ||
                        user_in_group(user, pw->pw_name)) {
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

    // argv[0] olarak &argv[1] veriliyor: çalışan sürece kullanıcının
    // yazdığı ad/yol görünür (ör. "pacman"), çözümlenen tam yol değil.
    //
    // Çözümlenmiş bir isimse (resolved_fd >= 0): fexecve() ile *doğrulama
    // sırasında açılan fd* çalıştırılıyor — yol yeniden aranmıyor, bu
    // yüzden doğrulama ile çalıştırma arasında dosyanın değiştirilmesi
    // (symlink saldırısı vb.) işe yaramaz.
    // Mutlak yol verilmişse (resolved_fd == -1): davranış eskisi gibi,
    // doğrudan execvp.
    if (resolved_fd >= 0) {
        fexecve(resolved_fd, &argv[1], environ);
    } else {
        execvp(argv[1], &argv[1]);
    }

    perror(MSG("Error: Command execution failed",
               "Hata: Komut çalıştırılamadı"));
    return 1;

pam_fail:
    fprintf(stderr, "\n[yt] %s %s\n", MSG("Error:", "Hata:"), pam_strerror(pamh, retval));
    if (pamh != NULL) pam_end(pamh, retval);
    return 1;
}
