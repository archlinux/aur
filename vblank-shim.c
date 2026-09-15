// LD_PRELOAD shim that lets Modrinth Enhanced (WebKitGTK 4.1 on GTK3) draw at
// the monitor's refresh rate with the NVIDIA driver instead of 60 Hz.
//
// Three things hold it at 60 Hz there:
//  1. WebKitGTK looks for the DRM CRTC of the monitor a window is on by
//     physical size, and the NVIDIA DRM connector reports slightly different
//     millimetres than GDK does, so no CRTC is found.
//  2. The NVIDIA DRM driver does not implement DRM_IOCTL_WAIT_VBLANK, so even a
//     found CRTC cannot be waited on. WebKit then paces with a 60 fps timer.
//  3. GTK3 paces its own paints from the refresh interval the display server
//     reports, and assumes 60 Hz without one. KWin reports none to it, on X11
//     (no _NET_WM_FRAME_TIMINGS for XWayland clients) and on Wayland alike.
//
// This shim:
//  1. corrects the connector size to what GDK reports for the same monitor,
//     found by output name on X11 ("DP-1") or EDID model name on Wayland;
//  2. emulates blocking vblank waits at the CRTC's refresh rate when the
//     driver refuses them;
//  3. fills in the monitor refresh interval on GTK3 frame timings that were
//     left without one.
//
// Each step only stands in for what is missing, so with drivers that report
// all of it the shim changes nothing.
//
// The frame rate only comes through on X11: on Wayland something in GTK3 or
// WebKit still asks for 60 frames a second. VBLANK_SHIM_GDK_BACKEND=x11 keeps
// GTK on X11 without setting GDK_BACKEND, which every program the app starts
// would inherit. A GDK_BACKEND the user set still wins.
//
// Build: gcc -shared -fPIC -O2 -o libwebkit-vblank-shim.so vblank-shim.c $(pkg-config --cflags glib-2.0) $(pkg-config --cflags --libs libdrm)
// Debug: VBLANK_SHIM_DEBUG=1
// Knobs: VBLANK_SHIM_RATE_MULTIPLIER (vblank emulation), VBLANK_SHIM_REFRESH_HZ
//        (GTK frame timings, default: fastest monitor), VBLANK_SHIM_FRAME_CLOCK=0
//        (leave GTK frame timings alone)

#define _GNU_SOURCE
#include <ctype.h>
#include <dlfcn.h>
#include <errno.h>
#include <glib-object.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <xf86drm.h>
#include <xf86drmMode.h>

typedef struct _GdkDisplay GdkDisplay;
typedef struct _GdkMonitor GdkMonitor;
typedef struct _GdkWindow GdkWindow;
typedef struct _GdkFrameClock GdkFrameClock;
typedef struct _GdkFrameTimings GdkFrameTimings;

static int debug_enabled(void) {
    static int value = -1;
    if (value < 0) value = getenv("VBLANK_SHIM_DEBUG") != NULL;
    return value;
}

#define debug(...) do { if (debug_enabled()) fprintf(stderr, "vblank-shim: " __VA_ARGS__); } while (0)

// --- 0. Window system -------------------------------------------------------

static char gdk_backend[16];

// Read on load, while nothing else runs, and taken out of the environment.
__attribute__((constructor))
static void take_gdk_backend(void) {
    const char *backend = getenv("VBLANK_SHIM_GDK_BACKEND");
    if (!backend) return;
    snprintf(gdk_backend, sizeof gdk_backend, "%s", backend);
    unsetenv("VBLANK_SHIM_GDK_BACKEND");
}

static void select_gdk_backend(void) {
    if (!gdk_backend[0] || getenv("GDK_BACKEND")) return;
    void (*set_allowed_backends)(const char *) = dlsym(RTLD_DEFAULT, "gdk_set_allowed_backends");
    if (set_allowed_backends) {
        set_allowed_backends(gdk_backend);
        debug("GDK limited to %s\n", gdk_backend);
    }
    gdk_backend[0] = '\0';
}

int gtk_init_check(int *argc, char ***argv) {
    static int (*real)(int *, char ***);
    if (!real) real = dlsym(RTLD_NEXT, "gtk_init_check");
    select_gdk_backend();
    return real(argc, argv);
}

void gtk_init(int *argc, char ***argv) {
    static void (*real)(int *, char ***);
    if (!real) real = dlsym(RTLD_NEXT, "gtk_init");
    select_gdk_backend();
    real(argc, argv);
}

// WebKit waits for vblank and GTK paints in the process the shim is preloaded
// into. Its children - WebKit's helper processes, and Minecraft started from
// the launcher - have no use for it, so it leaves LD_PRELOAD on load and keeps
// whatever else is in there.
__attribute__((constructor))
static void leave_ld_preload(void) {
    const char *preload = getenv("LD_PRELOAD");
    Dl_info info;
    if (!preload || !dladdr((void *)leave_ld_preload, &info) || !info.dli_fname) return;
    const char *self = strrchr(info.dli_fname, '/');
    self = self ? self + 1 : info.dli_fname;

    char *entries = strdup(preload), *kept = calloc(1, strlen(preload) + 1);
    if (entries && kept) {
        char *save = NULL;
        for (char *entry = strtok_r(entries, ": ", &save); entry; entry = strtok_r(NULL, ": ", &save)) {
            const char *name = strrchr(entry, '/');
            if (strcmp(name ? name + 1 : entry, self) == 0) continue;
            if (*kept) strcat(kept, ":");
            strcat(kept, entry);
        }
        if (*kept) setenv("LD_PRELOAD", kept, 1);
        else unsetenv("LD_PRELOAD");
    }
    free(entries);
    free(kept);
}

// GTK and GLib are looked up at run time rather than linked, so the shim loads
// into processes without them (such as the shell script that starts the
// AppImage) and still finds them when they are loaded later with dlopen.
static struct {
    GdkDisplay *(*display_get_default)(void);
    int (*display_get_n_monitors)(GdkDisplay *);
    GdkMonitor *(*display_get_monitor)(GdkDisplay *, int);
    const char *(*monitor_get_model)(GdkMonitor *);
    int (*monitor_get_width_mm)(GdkMonitor *);
    int (*monitor_get_height_mm)(GdkMonitor *);
    int (*monitor_get_refresh_rate)(GdkMonitor *);
    GType (*frame_clock_get_type)(void);
    GdkFrameTimings *(*frame_clock_get_current_timings)(GdkFrameClock *);
    gint64 (*frame_timings_get_refresh_interval)(GdkFrameTimings *);
    gpointer (*type_class_ref)(GType);
    guint (*signal_lookup)(const gchar *, GType);
    gulong (*signal_add_emission_hook)(guint, GQuark, GSignalEmissionHook, gpointer, GDestroyNotify);
    gpointer (*value_get_object)(const GValue *);
} gtk;

static int gtk_resolved(void) {
    if (gtk.value_get_object) return 1;
    #define RESOLVE(field, name) if (!(gtk.field = dlsym(RTLD_DEFAULT, name))) return 0
    RESOLVE(display_get_default, "gdk_display_get_default");
    RESOLVE(display_get_n_monitors, "gdk_display_get_n_monitors");
    RESOLVE(display_get_monitor, "gdk_display_get_monitor");
    RESOLVE(monitor_get_model, "gdk_monitor_get_model");
    RESOLVE(monitor_get_width_mm, "gdk_monitor_get_width_mm");
    RESOLVE(monitor_get_height_mm, "gdk_monitor_get_height_mm");
    RESOLVE(monitor_get_refresh_rate, "gdk_monitor_get_refresh_rate");
    RESOLVE(frame_clock_get_type, "gdk_frame_clock_get_type");
    RESOLVE(frame_clock_get_current_timings, "gdk_frame_clock_get_current_timings");
    RESOLVE(frame_timings_get_refresh_interval, "gdk_frame_timings_get_refresh_interval");
    RESOLVE(type_class_ref, "g_type_class_ref");
    RESOLVE(signal_lookup, "g_signal_lookup");
    RESOLVE(signal_add_emission_hook, "g_signal_add_emission_hook");
    RESOLVE(value_get_object, "g_value_get_object");
    #undef RESOLVE
    return 1;
}

// --- 1. Connector size ------------------------------------------------------

static const char *connector_prefix(uint32_t type) {
    switch (type) {
    case DRM_MODE_CONNECTOR_DisplayPort: return "DP";
    case DRM_MODE_CONNECTOR_HDMIA: return "HDMI-A";
    case DRM_MODE_CONNECTOR_HDMIB: return "HDMI-B";
    case DRM_MODE_CONNECTOR_DVID: return "DVI-D";
    case DRM_MODE_CONNECTOR_DVII: return "DVI-I";
    case DRM_MODE_CONNECTOR_eDP: return "eDP";
    case DRM_MODE_CONNECTOR_VGA: return "VGA";
    default: return NULL;
    }
}

// The monitor name descriptor (0xFC) of the connector's EDID, which is what
// GDK's Wayland backend reports as the monitor model.
static void edid_model_name(int fd, uint32_t connector_id, char *out, size_t size) {
    out[0] = '\0';
    drmModeObjectPropertiesPtr props = drmModeObjectGetProperties(fd, connector_id, DRM_MODE_OBJECT_CONNECTOR);
    if (!props) return;
    for (uint32_t i = 0; i < props->count_props && !out[0]; i++) {
        drmModePropertyPtr prop = drmModeGetProperty(fd, props->props[i]);
        if (prop && strcmp(prop->name, "EDID") == 0 && props->prop_values[i]) {
            drmModePropertyBlobPtr blob = drmModeGetPropertyBlob(fd, props->prop_values[i]);
            if (blob && blob->length >= 128) {
                const unsigned char *edid = blob->data;
                for (int d = 54; d <= 108; d += 18) {
                    if (edid[d] || edid[d + 1] || edid[d + 2] || edid[d + 3] != 0xFC) continue;
                    size_t n = 0;
                    for (int k = 5; k < 18 && n + 1 < size && edid[d + k] != '\n'; k++) out[n++] = edid[d + k];
                    while (n && isspace((unsigned char)out[n - 1])) n--;
                    out[n] = '\0';
                    break;
                }
            }
            drmModeFreePropertyBlob(blob);
        }
        drmModeFreeProperty(prop);
    }
    drmModeFreeObjectProperties(props);
}

drmModeConnectorPtr drmModeGetConnector(int fd, uint32_t connector_id) {
    static drmModeConnectorPtr (*real)(int, uint32_t);
    if (!real) real = dlsym(RTLD_NEXT, "drmModeGetConnector");
    drmModeConnectorPtr connector = real(fd, connector_id);
    if (!connector || connector->connection != DRM_MODE_CONNECTED || !gtk_resolved()) return connector;

    GdkDisplay *display = gtk.display_get_default();
    if (!display) return connector;

    char output_name[32] = "";
    const char *prefix = connector_prefix(connector->connector_type);
    if (prefix) snprintf(output_name, sizeof output_name, "%s-%u", prefix, connector->connector_type_id);
    char edid_name[32];
    edid_model_name(fd, connector_id, edid_name, sizeof edid_name);

    for (int i = 0; i < gtk.display_get_n_monitors(display); i++) {
        GdkMonitor *monitor = gtk.display_get_monitor(display, i);
        const char *model = gtk.monitor_get_model(monitor);
        if (!model) continue;
        if (!(output_name[0] && strcmp(model, output_name) == 0) && !(edid_name[0] && strcmp(model, edid_name) == 0))
            continue;
        int w = gtk.monitor_get_width_mm(monitor), h = gtk.monitor_get_height_mm(monitor);
        if (w > 0 && h > 0 && ((uint32_t)w != connector->mmWidth || (uint32_t)h != connector->mmHeight)) {
            debug("%s (%s): connector size %ux%u mm -> %dx%d mm (as GDK reports)\n", output_name, edid_name,
                  connector->mmWidth, connector->mmHeight, w, h);
            connector->mmWidth = w;
            connector->mmHeight = h;
        }
        break;
    }
    return connector;
}

// --- 2. Vblank emulation ----------------------------------------------------

struct emulated_crtc {
    int fd;
    unsigned index;
    long long period_ns;
    struct timespec base;
};

static struct emulated_crtc crtcs[16];
static int crtc_count;
static pthread_mutex_t crtcs_lock = PTHREAD_MUTEX_INITIALIZER;

static long long to_ns(const struct timespec *t) {
    return (long long)t->tv_sec * 1000000000LL + t->tv_nsec;
}

static double rate_multiplier(void) {
    const char *value = getenv("VBLANK_SHIM_RATE_MULTIPLIER");
    double multiplier = value ? atof(value) : 1.0;
    return multiplier >= 1.0 ? multiplier : 1.0;
}

static long long refresh_period_ns(int fd, unsigned index) {
    long long period = (long long)(1e9 / (60 * rate_multiplier()));
    drmModeResPtr resources = drmModeGetResources(fd);
    if (!resources) return period;
    if ((int)index < resources->count_crtcs) {
        drmModeCrtcPtr crtc = drmModeGetCrtc(fd, resources->crtcs[index]);
        if (crtc && crtc->mode_valid && crtc->mode.htotal && crtc->mode.vtotal) {
            const drmModeModeInfo *mode = &crtc->mode;
            double hz = mode->clock * 1000.0 / ((double)mode->htotal * mode->vtotal);
            if (mode->flags & DRM_MODE_FLAG_INTERLACE) hz *= 2;
            if (mode->flags & DRM_MODE_FLAG_DBLSCAN) hz /= 2;
            if (mode->vscan > 1) hz /= mode->vscan;
            if (hz > 1) period = (long long)(1e9 / (hz * rate_multiplier()));
            debug("emulating vblank for crtc index %u at %.3f Hz x %.1f\n", index, hz, rate_multiplier());
        }
        drmModeFreeCrtc(crtc);
    }
    drmModeFreeResources(resources);
    return period;
}

static struct emulated_crtc *emulated_crtc_for(int fd, unsigned index) {
    pthread_mutex_lock(&crtcs_lock);
    struct emulated_crtc *found = NULL;
    for (int i = 0; i < crtc_count; i++) {
        if (crtcs[i].fd == fd && crtcs[i].index == index) {
            found = &crtcs[i];
            break;
        }
    }
    if (!found && crtc_count < (int)(sizeof crtcs / sizeof crtcs[0])) {
        found = &crtcs[crtc_count++];
        found->fd = fd;
        found->index = index;
        found->period_ns = refresh_period_ns(fd, index);
        clock_gettime(CLOCK_MONOTONIC, &found->base);
    }
    pthread_mutex_unlock(&crtcs_lock);
    return found;
}

int drmWaitVBlank(int fd, drmVBlankPtr vbl) {
    static int (*real)(int, drmVBlankPtr);
    if (!real) real = dlsym(RTLD_NEXT, "drmWaitVBlank");

    drmVBlankReq request = vbl->request;
    int ret = real(fd, vbl);
    if (ret == 0) return 0;

    int error = errno;
    // Only stand in for a driver that does not do vblank waits at all, and only
    // for plain blocking waits.
    if ((error != EOPNOTSUPP && error != EPERM) || (request.type & (DRM_VBLANK_EVENT | DRM_VBLANK_SIGNAL))) {
        errno = error;
        return ret;
    }

    unsigned index = (request.type & DRM_VBLANK_SECONDARY)
        ? 1
        : (request.type & DRM_VBLANK_HIGH_CRTC_MASK) >> DRM_VBLANK_HIGH_CRTC_SHIFT;
    struct emulated_crtc *crtc = emulated_crtc_for(fd, index);
    if (!crtc) {
        errno = error;
        return ret;
    }

    struct timespec now;
    clock_gettime(CLOCK_MONOTONIC, &now);
    long long base = to_ns(&crtc->base);
    long long current = (to_ns(&now) - base) / crtc->period_ns;
    long long target;
    if (request.type & DRM_VBLANK_RELATIVE) {
        target = current + request.sequence;
    } else {
        target = request.sequence;
        if (target <= current && (request.type & DRM_VBLANK_NEXTONMISS)) target = current + 1;
    }
    if (target < current) target = current;

    long long when = base + target * crtc->period_ns;
    if (target > current) {
        struct timespec until = { when / 1000000000LL, when % 1000000000LL };
        while (clock_nanosleep(CLOCK_MONOTONIC, TIMER_ABSTIME, &until, NULL) == EINTR) {
        }
    }

    vbl->reply.type = request.type;
    vbl->reply.sequence = (unsigned)target;
    vbl->reply.tval_sec = when / 1000000000LL;
    vbl->reply.tval_usec = (when % 1000000000LL) / 1000;
    return 0;
}

// --- 3. GTK3 frame timings --------------------------------------------------

static gint64 frame_refresh_interval_us;
// Offset of the refresh_interval field inside GdkFrameTimings, found through
// the public getter rather than assumed. -1: not found yet, -2: give up.
static long refresh_interval_offset = -1;

static gint64 monitor_refresh_interval_us(void) {
    const char *forced = getenv("VBLANK_SHIM_REFRESH_HZ");
    if (forced && atof(forced) > 1) return (gint64)(1e6 / atof(forced));
    GdkDisplay *display = gtk.display_get_default();
    if (!display) return 0;
    int fastest = 0;
    for (int i = 0; i < gtk.display_get_n_monitors(display); i++) {
        int rate = gtk.monitor_get_refresh_rate(gtk.display_get_monitor(display, i));
        if (rate > fastest) fastest = rate;
    }
    // GDK reports milli-hertz.
    return fastest > 0 ? (gint64)(1000000000LL / fastest) : 0;
}

static long find_refresh_interval_offset(GdkFrameTimings *timings) {
    gint64 *slots = (gint64 *)timings;
    // The struct starts with a guint ref_count; the gint64 fields follow it.
    for (long offset = 8; offset <= 96; offset += 8) {
        gint64 saved = slots[offset / 8];
        slots[offset / 8] = 0x5eed5eed5eedLL;
        gboolean match = gtk.frame_timings_get_refresh_interval(timings) == 0x5eed5eed5eedLL;
        slots[offset / 8] = saved;
        if (match) return offset;
    }
    return -2;
}

static gboolean after_paint_hook(GSignalInvocationHint *hint, guint n_params, const GValue *params, gpointer data) {
    (void)hint;
    (void)data;
    if (n_params < 1 || refresh_interval_offset == -2) return TRUE;
    GdkFrameTimings *timings = gtk.frame_clock_get_current_timings(gtk.value_get_object(&params[0]));
    // Only frames the backend left without a refresh interval.
    if (!timings || gtk.frame_timings_get_refresh_interval(timings) != 0) return TRUE;

    if (!frame_refresh_interval_us) frame_refresh_interval_us = monitor_refresh_interval_us();
    if (frame_refresh_interval_us <= 0) return TRUE;
    if (refresh_interval_offset == -1) {
        refresh_interval_offset = find_refresh_interval_offset(timings);
        if (refresh_interval_offset < 0) {
            debug("could not locate refresh_interval in GdkFrameTimings, leaving GTK alone\n");
            return TRUE;
        }
        debug("GTK frame timings: refresh interval %" G_GINT64_FORMAT " us (offset %ld)\n",
              frame_refresh_interval_us, refresh_interval_offset);
    }
    ((gint64 *)timings)[refresh_interval_offset / 8] = frame_refresh_interval_us;
    return TRUE;
}

static void install_frame_clock_hook(void) {
    const char *enabled = getenv("VBLANK_SHIM_FRAME_CLOCK");
    if (enabled && strcmp(enabled, "0") == 0) return;
    if (!gtk_resolved()) return;
    GType type = gtk.frame_clock_get_type();
    gtk.type_class_ref(type);  // signals exist once the class does; keep it alive
    guint signal = gtk.signal_lookup("after-paint", type);
    if (!signal) return;
    gtk.signal_add_emission_hook(signal, 0, after_paint_hook, NULL, NULL);
    debug("installed GTK after-paint hook\n");
}

GdkFrameClock *gdk_window_get_frame_clock(GdkWindow *window) {
    static GdkFrameClock *(*real)(GdkWindow *);
    static pthread_once_t once = PTHREAD_ONCE_INIT;
    if (!real) real = dlsym(RTLD_NEXT, "gdk_window_get_frame_clock");
    GdkFrameClock *clock = real(window);
    if (clock) pthread_once(&once, install_frame_clock_hook);
    return clock;
}
