#define _GNU_SOURCE
#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <link.h>
#include <pthread.h>
#include <stdarg.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

/*
 * Browser process only.
 *
 * LarkThemeImpl lives in libframe BSS; its vtable is in RELRO (not RX).
 * Scanning must cover every PT_LOAD. Re-apply FOLLOW_SYSTEM on the GLib
 * UI thread via SetAppColorScheme after patching the NativeTheme offset.
 */

static const unsigned char kPat[] = {
    0x44, 0x0f, 0xb6, 0x46, 0x40,
    0x44, 0x89, 0x47, 0x70
};
static const unsigned char kOff = 4;
static const unsigned char kNew = 0x69;

static const uintptr_t kImplPlus8 = 0x14b96e98;
static const uintptr_t kSetAppColorScheme = 0x7f4c920;
static const uintptr_t kOnNativeThemeUpdated = 0x7f4e150;

static int g_patched;
static int g_kicked;
static int g_scheduled;
static int g_want_dark = -1;
static uintptr_t g_base;
static uintptr_t g_lo = UINTPTR_MAX, g_hi;
static FILE *g_log;

static void logmsg(const char *fmt, ...) {
    if (!g_log) {
        const char *home = getenv("HOME");
        char path[512];
        if (!home)
            return;
        snprintf(path, sizeof(path), "%s/.config/LarkShell", home);
        mkdir(path, 0755);
        snprintf(path, sizeof(path),
                 "%s/.config/LarkShell/linux-theme-preload.log", home);
        g_log = fopen(path, "a");
        if (!g_log)
            return;
        setvbuf(g_log, NULL, _IOLBF, 0);
    }
    va_list ap;
    va_start(ap, fmt);
    vfprintf(g_log, fmt, ap);
    va_end(ap);
}

static int is_feishu_browser(void) {
    char exe[PATH_MAX];
    ssize_t n = readlink("/proc/self/exe", exe, sizeof(exe) - 1);
    if (n < 0)
        return 0;
    exe[n] = '\0';
    if (!strstr(exe, "/feishu") || strstr(exe, "feishu-bin"))
        return 0;

    char buf[8192];
    int fd = open("/proc/self/cmdline", O_RDONLY);
    if (fd < 0)
        return 1;
    ssize_t m = read(fd, buf, sizeof(buf) - 1);
    close(fd);
    if (m <= 0)
        return 1;
    buf[m] = '\0';
    for (ssize_t i = 0; i < m;) {
        if (strncmp(buf + i, "--type=", 7) == 0)
            return 0;
        i += (ssize_t)strlen(buf + i) + 1;
    }
    return 1;
}

static int in_frame(const void *p) {
    uintptr_t u = (uintptr_t)p;
    return g_hi > g_lo && u >= g_lo && u < g_hi;
}

static int patch_phdr(struct dl_phdr_info *info, size_t size, void *data) {
    (void)size;
    (void)data;
    if (!info->dlpi_name || !strstr(info->dlpi_name, "libframe.so"))
        return 0;

    long ps = sysconf(_SC_PAGESIZE);
    if (ps <= 0)
        ps = 4096;

    g_base = info->dlpi_addr;
    g_lo = UINTPTR_MAX;
    g_hi = 0;
    unsigned char *hit = NULL;
    uintptr_t hit_page_ps = (uintptr_t)ps;

    for (int i = 0; i < info->dlpi_phnum; i++) {
        const ElfW(Phdr) *ph = &info->dlpi_phdr[i];
        if (ph->p_type != PT_LOAD)
            continue;
        uintptr_t s = info->dlpi_addr + ph->p_vaddr;
        uintptr_t e = s + ph->p_memsz;
        if (s < g_lo)
            g_lo = s;
        if (e > g_hi)
            g_hi = e;
        if (!(ph->p_flags & PF_X) || hit)
            continue;
        unsigned char *found = memmem((void *)s, ph->p_memsz, kPat, sizeof(kPat));
        if (found)
            hit = found;
    }
    if (!hit)
        return 0;

    uintptr_t start = (uintptr_t)hit & ~(hit_page_ps - 1);
    uintptr_t end = ((uintptr_t)hit + sizeof(kPat) + hit_page_ps - 1) &
                    ~(hit_page_ps - 1);
    if (mprotect((void *)start, end - start, PROT_READ | PROT_WRITE | PROT_EXEC) != 0) {
        logmsg("mprotect(rwx) failed\n");
        return 1;
    }
    hit[kOff] = kNew;
    mprotect((void *)start, end - start, PROT_READ | PROT_EXEC);
    __atomic_store_n(&g_patched, 1, __ATOMIC_RELEASE);
    logmsg("patched +0x40 -> +0x69 at %p base=%p lo=%p hi=%p\n", (void *)hit,
           (void *)g_base, (void *)g_lo, (void *)g_hi);
    return 1;
}

typedef unsigned (*g_idle_add_fn)(int (*func)(void *), void *);
typedef void *(*gtk_settings_get_default_fn)(void);
typedef void (*g_object_set_fn)(void *, const char *, ...);
typedef void (*set_scheme_fn)(void *, int);
typedef void (*onu_fn)(void *, void *);

static g_idle_add_fn lookup_idle(void) {
    g_idle_add_fn idle = (g_idle_add_fn)dlsym(RTLD_DEFAULT, "g_idle_add");
    if (idle)
        return idle;
    void *h = dlopen("libglib-2.0.so.0", RTLD_LAZY | RTLD_NOLOAD);
    if (!h)
        h = dlopen("libglib-2.0.so.0", RTLD_LAZY | RTLD_GLOBAL);
    if (!h)
        return NULL;
    return (g_idle_add_fn)dlsym(h, "g_idle_add");
}

static int ui_kick(void *arg) {
    (void)arg;
    int dark = __atomic_load_n(&g_want_dark, __ATOMIC_ACQUIRE);
    if (dark < 0)
        dark = 1;

    gtk_settings_get_default_fn get_def =
        (gtk_settings_get_default_fn)dlsym(RTLD_DEFAULT, "gtk_settings_get_default");
    g_object_set_fn obj_set = (g_object_set_fn)dlsym(RTLD_DEFAULT, "g_object_set");
    if (get_def && obj_set) {
        void *settings = get_def();
        if (settings)
            obj_set(settings, "gtk-application-prefer-dark-theme", dark, NULL);
    }

    if (!g_base)
        return 1;

    void *slot = *(void **)(g_base + kImplPlus8);
    if (!slot)
        return 1;

    unsigned char *impl = (unsigned char *)slot - 8;
    uint32_t pref = *(uint32_t *)(impl + 0x74);
    uint32_t os = *(uint32_t *)(impl + 0x70);
    void *vt = *(void **)impl;
    logmsg("ui: impl=%p vt=%p pref=%u os=%u dark=%d in_impl=%d in_vt=%d\n",
           (void *)impl, vt, pref, os, dark, in_frame(impl), in_frame(vt));

    if (pref > 2) {
        logmsg("ui: pref out of range, skip\n");
        return 0;
    }
    if (pref != 2) {
        logmsg("ui: pref=%u not FOLLOW_SYSTEM, skip\n", pref);
        __atomic_store_n(&g_kicked, 1, __ATOMIC_RELEASE);
        return 0;
    }

    *(uint32_t *)(impl + 0x70) = (uint32_t)dark;
    set_scheme_fn set = (set_scheme_fn)(g_base + kSetAppColorScheme);
    set(impl, 2);
    logmsg("ui: SetAppColorScheme(FOLLOW_SYSTEM) os_now=%u\n",
           *(uint32_t *)(impl + 0x70));

    unsigned char fake[0x80];
    memset(fake, 0, sizeof(fake));
    fake[0x69] = (unsigned char)dark;
    onu_fn onu = (onu_fn)(g_base + kOnNativeThemeUpdated);
    onu(impl, fake);
    logmsg("ui: OnNativeThemeUpdated pref=%u os=%u\n",
           *(uint32_t *)(impl + 0x74), *(uint32_t *)(impl + 0x70));

    __atomic_store_n(&g_kicked, 1, __ATOMIC_RELEASE);
    return 0;
}

static void schedule_ui_kick(void) {
    if (__atomic_load_n(&g_scheduled, __ATOMIC_ACQUIRE))
        return;
    g_idle_add_fn idle = lookup_idle();
    if (!idle)
        return;
    __atomic_store_n(&g_scheduled, 1, __ATOMIC_RELEASE);
    idle(ui_kick, NULL);
    logmsg("ui: g_idle_add queued\n");
}

static int parse_color_scheme(const char *buf) {
    if (!buf)
        return -1;
    if (strstr(buf, "uint32 1") || strstr(buf, "uint32 0x1") ||
        strstr(buf, "<<1>>"))
        return 1;
    if (strstr(buf, "uint32 2") || strstr(buf, "uint32 0x2") ||
        strstr(buf, "<<2>>"))
        return 0;
    return -1;
}

static int read_portal(void) {
    FILE *fp = popen(
        "gdbus call --session --dest org.freedesktop.portal.Desktop "
        "--object-path /org/freedesktop/portal/desktop "
        "--method org.freedesktop.portal.Settings.Read "
        "org.freedesktop.appearance color-scheme 2>/dev/null",
        "r");
    if (!fp)
        return -1;
    char buf[192];
    if (!fgets(buf, sizeof(buf), fp)) {
        pclose(fp);
        return -1;
    }
    pclose(fp);
    return parse_color_scheme(buf);
}

static void apply_portal_value(int dark, int force_log) {
    if (dark < 0)
        return;
    int old = __atomic_load_n(&g_want_dark, __ATOMIC_ACQUIRE);
    if (old == dark)
        return;
    __atomic_store_n(&g_want_dark, dark, __ATOMIC_RELEASE);
    logmsg("portal color-scheme=%s (was %s)\n", dark ? "1/dark" : "2/light",
           old < 0 ? "unset" : (old ? "1/dark" : "2/light"));
    (void)force_log;
    __atomic_store_n(&g_scheduled, 0, __ATOMIC_RELEASE);
    schedule_ui_kick();
}

static void watch_portal(void) {
    logmsg("watching org.freedesktop.appearance color-scheme\n");
    FILE *fp = popen(
        "stdbuf -oL gdbus monitor --session "
        "--dest org.freedesktop.portal.Desktop 2>/dev/null",
        "r");
    if (fp)
        setvbuf(fp, NULL, _IOLBF, 0);
    char line[1024];
    int ticks = 0;
    if (!fp) {
        for (;;) {
            apply_portal_value(read_portal(), 0);
            sleep(1);
        }
    }
    int flags = fcntl(fileno(fp), F_GETFL, 0);
    if (flags >= 0)
        fcntl(fileno(fp), F_SETFL, flags | O_NONBLOCK);
    for (;;) {
        char *got = fgets(line, sizeof(line), fp);
        if (got) {
            if (strstr(line, "color-scheme") || strstr(line, "SettingChanged")) {
                int d = parse_color_scheme(line);
                if (d < 0)
                    d = read_portal();
                apply_portal_value(d, 0);
            }
            continue;
        }
        if (ferror(fp) && errno != EAGAIN && errno != EWOULDBLOCK)
            break;
        clearerr(fp);
        /* Backup poll: some portals fire SettingChanged in a form we miss. */
        if ((ticks++ % 4) == 0)
            apply_portal_value(read_portal(), 0);
        usleep(250 * 1000);
    }
    pclose(fp);
    for (;;) {
        apply_portal_value(read_portal(), 0);
        sleep(1);
    }
}

static void *patch_thread(void *arg) {
    (void)arg;
    apply_portal_value(read_portal(), 1);
    for (int i = 0; i < 150; i++) {
        if (!__atomic_load_n(&g_patched, __ATOMIC_ACQUIRE))
            dl_iterate_phdr(patch_phdr, NULL);
        if (__atomic_load_n(&g_patched, __ATOMIC_ACQUIRE))
            schedule_ui_kick();
        if (__atomic_load_n(&g_kicked, __ATOMIC_ACQUIRE)) {
            watch_portal();
            return NULL;
        }
        if (i == 20 || i == 50)
            __atomic_store_n(&g_scheduled, 0, __ATOMIC_RELEASE);
        usleep(100 * 1000);
    }
    if (!__atomic_load_n(&g_patched, __ATOMIC_ACQUIRE))
        logmsg("libframe pattern not found in feishu browser process\n");
    else if (!__atomic_load_n(&g_kicked, __ATOMIC_ACQUIRE))
        logmsg("ui kick never completed\n");
    else
        watch_portal();
    return NULL;
}

__attribute__((constructor)) static void init(void) {
    if (!is_feishu_browser())
        return;
    pthread_t th;
    pthread_attr_t attr;
    pthread_attr_init(&attr);
    pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    if (pthread_create(&th, &attr, patch_thread, NULL) != 0)
        logmsg("patch thread failed\n");
    pthread_attr_destroy(&attr);
}
