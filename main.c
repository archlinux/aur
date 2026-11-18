/* SPDX-License-Identifier: GPL-3.0-or-later
 * sbxkb: XKB indicator and per-window layout switcher.
 * Modernized implementation and bug fixes authored by Codex (OpenAI), 2026.
 * Replaces the GTK2 implementation by Yrij Tuljakov (2009),
 * Anatoly Asviyan (2002), and Peter Zelezny (2000).
 */
#define _POSIX_C_SOURCE 200809L
#include <X11/Xlib.h>
#include <X11/Xutil.h>
#include <X11/Xatom.h>
#include <X11/XKBlib.h>
#include <png.h>
#include <ctype.h>
#include <errno.h>
#include <poll.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#ifndef SBXKB_DATA_DIR
#define SBXKB_DATA_DIR "/usr/local/share/sbxkb"
#endif
#define VERSION "0.8.0"
#define ICON_SIZE 24

typedef struct { unsigned width, height; unsigned char *pixels; } Image;
typedef struct { char symbol[64], name[256]; Image image; } Group;
typedef struct Saved { Window window; int group; struct Saved *next; } Saved;
static Display *dpy;
static Window root, control, icon, manager, active;
static Atom tray_selection, tray_opcode, manager_atom, tray_visual, active_atom;
static Atom rules_atom, wm_state, singleton;
static Visual *visual;
static Colormap colormap;
static int depth, screen, xkb_event, ngroups = 1, current, default_group;
static unsigned width = ICON_SIZE, height = ICON_SIZE;
static unsigned long alpha_mask;
static Group groups[XkbNumKbdGroups];
static Saved *saved;
static bool global_layout;
static const char *icons_dir;
static volatile sig_atomic_t running = 1;

static void stop(int sig) { (void)sig; running = 0; }

static int xerror(Display *display, XErrorEvent *e)
{
    /* Windows can disappear between querying focus/selection and selecting events. */
    if (e->error_code != BadWindow && e->error_code != BadDrawable) {
        char message[256];
        XGetErrorText(display, e->error_code, message, sizeof message);
        fprintf(stderr, "sbxkb: X11 error: %s (request %u)\n", message, e->request_code);
    }
    return 0;
}

static long long milliseconds(void)
{
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return (long long)t.tv_sec * 1000 + t.tv_nsec / 1000000;
}

static bool load_image(const char *path, Image *out)
{
    png_image image = {0};
    image.version = PNG_IMAGE_VERSION;
    if (!png_image_begin_read_from_file(&image, path)) return false;
    /* Bound custom input before allocating/decompressing. */
    if (!image.width || !image.height || image.width > 1024 || image.height > 1024) {
        png_image_free(&image);
        return false;
    }
    image.format = PNG_FORMAT_RGBA;
    unsigned char *pixels = malloc(PNG_IMAGE_SIZE(image));
    if (!pixels || !png_image_finish_read(&image, NULL, pixels, 0, NULL)) {
        free(pixels);
        png_image_free(&image);
        return false;
    }
    *out = (Image){image.width, image.height, pixels};
    png_image_free(&image);
    return true;
}

static void load_flag(Group *group)
{
    const char *home = getenv("HOME");
    char path[4096];
    /* XKB properties must never become arbitrary paths. */
    for (const unsigned char *p = (unsigned char *)group->symbol; *p; p++)
        if (!isalnum(*p) && *p != '_' && *p != '-') return;
    if (icons_dir) {
        snprintf(path, sizeof path, "%s/%s.png", icons_dir, group->symbol);
        if (load_image(path, &group->image)) return;
    }
    if (home) {
        snprintf(path, sizeof path, "%s/.icons/flags/%s.png", home, group->symbol);
        if (load_image(path, &group->image)) return;
    }
    snprintf(path, sizeof path, "%s/%s.png", SBXKB_DATA_DIR, group->symbol);
    if (load_image(path, &group->image)) return;
    /* Allow running an uninstalled build from the source directory. */
    snprintf(path, sizeof path, "images/%s.png", group->symbol);
    (void)load_image(path, &group->image);
}

static void clear_saved(void)
{
    while (saved) { Saved *next = saved->next; free(saved); saved = next; }
}

static void forget(Window window)
{
    Saved **p = &saved;
    while (*p) {
        if ((*p)->window == window) {
            Saved *old = *p; *p = old->next; free(old); return;
        }
        p = &(*p)->next;
    }
}

static Saved *remember(Window window, int group)
{
    for (Saved *s = saved; s; s = s->next)
        if (s->window == window) return s;
    Saved *s = calloc(1, sizeof *s);
    if (!s) return NULL;
    *s = (Saved){window, group, saved}; saved = s;
    XSelectInput(dpy, window, StructureNotifyMask);
    return s;
}

static unsigned char *property(Window window, Atom atom, Atom wanted,
                               unsigned long *count, int *format)
{
    Atom type;
    unsigned long after;
    unsigned char *data = NULL;
    *count = 0; *format = 0;
    if (XGetWindowProperty(dpy, window, atom, 0, 4096, False, wanted,
                          &type, format, count, &after, &data) != Success ||
        type != wanted || after) {
        if (data) XFree(data);
        *count = 0; *format = 0;
        return NULL;
    }
    return data;
}

static Window focused_window(void)
{
    unsigned long count;
    int format;
    unsigned char *data = property(root, active_atom, XA_WINDOW, &count, &format);
    Window w = None;
    if (data && count == 1 && format == 32) w = *(unsigned long *)data;
    if (data) XFree(data);
    if (!w) {
        int revert;
        XGetInputFocus(dpy, &w, &revert);
        if (w == None || w == PointerRoot || w == root) return None;
        /* Resolve focused child widgets to their client window, even without EWMH. */
        for (int n = 0; n < 64; n++) {
            data = property(w, wm_state, wm_state, &count, &format);
            bool client = data && count >= 1;
            if (data) XFree(data);
            if (client) break;
            Window r, parent, *children = NULL;
            unsigned nchildren;
            if (!XQueryTree(dpy, w, &r, &parent, &children, &nchildren)) break;
            if (children) XFree(children);
            if (!parent || parent == root) break;
            w = parent;
        }
    }
    return w == icon || w == control || w == manager || w == root ? None : w;
}

static void sync_focus(void)
{
    Window w = focused_window();
    if (!w || w == active) return;
    active = w;
    if (global_layout) return;
    Saved *s = remember(w, default_group);
    if (s && s->group >= 0 && s->group < ngroups && s->group != current) {
        XkbLockGroup(dpy, XkbUseCoreKbd, (unsigned)s->group);
        XFlush(dpy);
    }
}

static void copy_symbol(char *out, size_t capacity, const char *text, size_t length)
{
    size_t n = 0;
    while (n < length && n + 1 < capacity &&
           (isalnum((unsigned char)text[n]) || text[n] == '_' || text[n] == '-')) {
        out[n] = text[n]; n++;
    }
    out[n] = 0;
}

/* _XKB_RULES_NAMES contains five NUL-terminated strings. Never read beyond it. */
static bool rule_symbols(const unsigned char *data, size_t size)
{
    const unsigned char *p = data, *end = data + size;
    for (int i = 0; i < 2; i++) {
        const unsigned char *nul = memchr(p, 0, (size_t)(end - p));
        if (!nul) return false;
        p = nul + 1;
    }
    const unsigned char *nul = memchr(p, 0, (size_t)(end - p));
    if (!nul) return false;
    int group = 0;
    while (p < nul && group < ngroups) {
        const unsigned char *comma = memchr(p, ',', (size_t)(nul - p));
        const unsigned char *next = comma ? comma : nul;
        copy_symbol(groups[group++].symbol, sizeof groups[0].symbol,
                    (const char *)p, (size_t)(next - p));
        p = next + (comma != NULL);
    }
    return group == ngroups;
}

static void read_keyboard(void)
{
    for (int i = 0; i < XkbNumKbdGroups; i++) free(groups[i].image.pixels);
    memset(groups, 0, sizeof groups);
    XkbDescPtr keyboard = XkbAllocKeyboard();
    ngroups = 1;
    if (keyboard) {
        keyboard->dpy = dpy; keyboard->device_spec = XkbUseCoreKbd;
        if (XkbGetControls(dpy, XkbAllControlsMask, keyboard) == Success && keyboard->ctrls)
            ngroups = keyboard->ctrls->num_groups;
        if (ngroups < 1 || ngroups > XkbNumKbdGroups) ngroups = 1;
        if (XkbGetNames(dpy, XkbGroupNamesMask | XkbSymbolsNameMask, keyboard) == Success && keyboard->names) {
            for (int i = 0; i < ngroups; i++) {
                Atom name = keyboard->names->groups[i];
                char *text = name ? XGetAtomName(dpy, name) : NULL;
                if (text) { snprintf(groups[i].name, sizeof groups[i].name, "%s", text); XFree(text); }
            }
            /* Fallback for maps installed by xkbcomp without rules properties. */
            char *symbols = keyboard->names->symbols ? XGetAtomName(dpy, keyboard->names->symbols) : NULL;
            if (symbols) {
                char *context, *token = strtok_r(symbols, "+", &context);
                while (token) {
                    char symbol[64];
                    copy_symbol(symbol, sizeof symbol, token, strlen(token));
                    char *colon = strrchr(token, ':');
                    char *end = NULL;
                    errno = 0;
                    long number = colon ? strtol(colon + 1, &end, 10) : 1;
                    long group = number >= 1 && number <= ngroups ? number - 1 : -1;
                    if (!errno && (!colon || (end != colon + 1 && !*end)) && group >= 0 &&
                        strcmp(symbol, "pc") && strlen(symbol) >= 2 && strlen(symbol) <= 3)
                        snprintf(groups[group].symbol, sizeof groups[group].symbol, "%s", symbol);
                    token = strtok_r(NULL, "+", &context);
                }
                XFree(symbols);
            }
        }
        XkbFreeKeyboard(keyboard, 0, True);
    }
    unsigned long count;
    int format;
    unsigned char *data = property(root, rules_atom, XA_STRING, &count, &format);
    if (data && format == 8) (void)rule_symbols(data, count);
    if (data) XFree(data);
    XkbStateRec state;
    current = XkbGetState(dpy, XkbUseCoreKbd, &state) == Success ? state.group : 0;
    if (current >= ngroups) {
        current = 0;
        XkbLockGroup(dpy, XkbUseCoreKbd, 0);
    }
    default_group = current;
    clear_saved(); active = None;
    for (int i = 0; i < ngroups; i++) {
        if (!groups[i].symbol[0]) snprintf(groups[i].symbol, sizeof groups[i].symbol, "%d", i + 1);
        if (!groups[i].name[0]) {
            size_t length = strnlen(groups[i].symbol, sizeof groups[i].symbol - 1);
            memcpy(groups[i].name, "Layout ", 7);
            memmove(groups[i].name + 7, groups[i].symbol, length);
            groups[i].name[7 + length] = 0;
        }
        load_flag(&groups[i]);
    }
}

static unsigned long component(unsigned value, unsigned long mask)
{
    if (!mask) return 0;
    unsigned shift = 0;
    while (!(mask & 1)) { mask >>= 1; shift++; }
    return ((value * mask + 127) / 255) << shift;
}

static void draw(void)
{
    if (!icon || current < 0 || current >= ngroups) return;
    Group *g = &groups[current];
    XStoreName(dpy, icon, g->name);
    XClearWindow(dpy, icon);
    GC gc = XCreateGC(dpy, icon, 0, NULL);
    if (g->image.pixels) {
        Image *source = &g->image;
        unsigned w = width > 4 ? width - 4 : width;
        unsigned h = height > 4 ? height - 4 : height;
        if ((uint64_t)w * source->height > (uint64_t)h * source->width)
            w = h * source->width / source->height;
        else h = w * source->height / source->width;
        if (!w) w = 1;
        if (!h) h = 1;
        XImage *image = XCreateImage(dpy, visual, (unsigned)depth, ZPixmap, 0, NULL, w, h, 32, 0);
        if (image) {
            image->data = calloc((size_t)image->bytes_per_line, h);
            if (image->data) {
                Pixmap mask = XCreatePixmap(dpy, icon, w, h, 1);
                GC mgc = XCreateGC(dpy, mask, 0, NULL);
                XSetForeground(dpy, mgc, 0); XFillRectangle(dpy, mask, mgc, 0, 0, w, h);
                XSetForeground(dpy, mgc, 1);
                for (unsigned y = 0; y < h; y++) for (unsigned x = 0; x < w; x++) {
                    unsigned char *p = source->pixels + 4 * ((size_t)(y * source->height / h) * source->width + x * source->width / w);
                    unsigned a = alpha_mask ? p[3] : 255;
                    unsigned long pixel = component(p[0] * a / 255, visual->red_mask) |
                        component(p[1] * a / 255, visual->green_mask) |
                        component(p[2] * a / 255, visual->blue_mask) | component(a, alpha_mask);
                    XPutPixel(image, (int)x, (int)y, pixel);
                    if (alpha_mask || p[3] >= 128) XDrawPoint(dpy, mask, mgc, (int)x, (int)y);
                }
                int ox = (int)(width - w) / 2, oy = (int)(height - h) / 2;
                XSetClipMask(dpy, gc, mask); XSetClipOrigin(dpy, gc, ox, oy);
                XPutImage(dpy, icon, gc, image, 0, 0, ox, oy, w, h);
                XFreeGC(dpy, mgc); XFreePixmap(dpy, mask);
            }
            XDestroyImage(image);
        }
    } else {
        /* Legible fallback for custom/non-country layouts and missing files. */
        XSetForeground(dpy, gc, visual->red_mask | visual->green_mask | visual->blue_mask | alpha_mask);
        XFillRectangle(dpy, icon, gc, 2, 3, width > 4 ? width - 4 : 1, height > 6 ? height - 6 : 1);
        XSetForeground(dpy, gc, alpha_mask);
        size_t len = strlen(g->symbol); if (len > 3) len = 3;
        XDrawString(dpy, icon, gc, 3, (int)height / 2 + 4, g->symbol, (int)len);
    }
    XFreeGC(dpy, gc);
    XFlush(dpy);
}

static void create_icon(void)
{
    if (icon) XDestroyWindow(dpy, icon);
    if (colormap) XFreeColormap(dpy, colormap);
    visual = DefaultVisual(dpy, screen); depth = DefaultDepth(dpy, screen); alpha_mask = 0;
    unsigned long count;
    int format;
    unsigned char *data = manager ? property(manager, tray_visual, XA_VISUALID, &count, &format) : NULL;
    if (data && count == 1 && format == 32) {
        XVisualInfo query = {.visualid = *(unsigned long *)data, .screen = screen};
        int n;
        XVisualInfo *info = XGetVisualInfo(dpy, VisualIDMask | VisualScreenMask, &query, &n);
        if (info && n && info->class == TrueColor) {
            visual = info->visual; depth = info->depth;
            if (depth == 32) alpha_mask = 0xffffffffUL & ~(visual->red_mask | visual->green_mask | visual->blue_mask);
        }
        if (info) XFree(info);
    }
    if (data) XFree(data);
    colormap = XCreateColormap(dpy, root, visual, AllocNone);
    XSetWindowAttributes attrs = {.background_pixel = 0, .border_pixel = 0, .colormap = colormap,
        .event_mask = ExposureMask | StructureNotifyMask | ButtonPressMask};
    width = height = ICON_SIZE;
    icon = XCreateWindow(dpy, root, 0, 0, width, height, 0, depth, InputOutput, visual,
                         CWBackPixel | CWBorderPixel | CWColormap | CWEventMask, &attrs);
    /* ParentRelative is installed after reparenting: the tray may advertise a
     * non-ARGB visual whose depth differs from the root window's depth. */
    XClassHint hint = {.res_name = "sbxkb", .res_class = "Sbxkb"};
    XSetClassHint(dpy, icon, &hint);
    unsigned long embed[] = {0, 1};
    Atom xembed = XInternAtom(dpy, "_XEMBED_INFO", False);
    XChangeProperty(dpy, icon, xembed, xembed, 32, PropModeReplace, (unsigned char *)embed, 2);
    XSizeHints size = {.flags = PMinSize | PBaseSize, .min_width = ICON_SIZE, .min_height = ICON_SIZE,
        .base_width = ICON_SIZE, .base_height = ICON_SIZE};
    XSetWMNormalHints(dpy, icon, &size);
    /* Do not map an orphan icon as a desktop window when no tray exists. */
    draw();
}

static void dock(void)
{
    Window owner = XGetSelectionOwner(dpy, tray_selection);
    if (owner == manager && icon) return;
    manager = owner;
    if (manager) XSelectInput(dpy, manager, StructureNotifyMask | PropertyChangeMask);
    create_icon();
    if (manager) {
        XEvent event = {0};
        event.xclient.type = ClientMessage;
        event.xclient.window = manager;
        event.xclient.message_type = tray_opcode;
        event.xclient.format = 32;
        event.xclient.data.l[0] = CurrentTime;
        event.xclient.data.l[1] = 0; /* SYSTEM_TRAY_REQUEST_DOCK */
        event.xclient.data.l[2] = (long)icon;
        XSendEvent(dpy, manager, False, NoEventMask, &event);
        XFlush(dpy);
    }
}

static void sync_state(void)
{
    /* A focus change may already be queued behind this state event. Resolve the
     * target first, then query after any layout restoration request. */
    sync_focus();
    XkbStateRec state;
    if (XkbGetState(dpy, XkbUseCoreKbd, &state) != Success || state.group >= ngroups) return;
    current = state.group;
    Window w = focused_window();
    if (!global_layout && w) {
        Saved *s = remember(w, current);
        if (s) s->group = current;
        active = w;
    }
    draw();
}

static void handle_event(XEvent *event)
{
    if (event->type == xkb_event) {
        XkbEvent *xkb = (XkbEvent *)event;
        if (xkb->any.xkb_type == XkbStateNotify) sync_state();
        else { read_keyboard(); draw(); }
    } else if (event->type == Expose && event->xexpose.window == icon && !event->xexpose.count) draw();
    else if (event->type == ConfigureNotify && event->xconfigure.window == icon) {
        width = (unsigned)event->xconfigure.width; height = (unsigned)event->xconfigure.height;
        if (width > 512) width = 512;
        if (height > 512) height = 512;
        draw();
    } else if (event->type == ReparentNotify && event->xreparent.window == icon) {
        if (!alpha_mask) XSetWindowBackgroundPixmap(dpy, icon, ParentRelative);
        draw();
    } else if (event->type == ButtonPress && event->xbutton.window == icon) {
        unsigned button = event->xbutton.button;
        if (button == 1 || button == 4 || button == 5) {
            int step = button == 4 ? ngroups - 1 : 1;
            XkbLockGroup(dpy, XkbUseCoreKbd, (unsigned)((current + step) % ngroups));
            XFlush(dpy);
        }
    } else if (event->type == DestroyNotify) {
        Window w = event->xdestroywindow.window;
        forget(w);
        if (w == active) active = None;
        if (w == icon) { icon = None; dock(); }
        else if (w == manager) { manager = None; dock(); }
    } else if (event->type == ClientMessage && event->xclient.message_type == manager_atom &&
               (Atom)event->xclient.data.l[1] == tray_selection) dock();
    else if (event->type == PropertyNotify) {
        if (event->xproperty.window == root && event->xproperty.atom == rules_atom) { read_keyboard(); draw(); }
        else if (event->xproperty.window == root && event->xproperty.atom == active_atom) sync_focus();
        else if (event->xproperty.window == manager && event->xproperty.atom == tray_visual) {
            manager = None; dock();
        }
    }
}

int main(int argc, char **argv)
{
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argv[i], "--help")) {
            puts("Usage: sbxkb [--global] [--icons-dir DIRECTORY]\n"
                 "X11 keyboard layout tray indicator. Click to cycle layouts; scroll to switch.\n"
                 "By default, each window remembers its layout. --global disables this.\n"
                 "Requires an XEmbed system tray. Stop with SIGTERM or Ctrl+C.");
            return 0;
        } else if (!strcmp(argv[i], "--version")) { puts("sbxkb " VERSION); return 0; }
        else if (!strcmp(argv[i], "--global")) global_layout = true;
        else if (!strcmp(argv[i], "--icons-dir") && i + 1 < argc) icons_dir = argv[++i];
        else { fprintf(stderr, "sbxkb: unknown or incomplete option: %s\n", argv[i]); return 2; }
    }
    dpy = XOpenDisplay(NULL);
    if (!dpy) { fputs("sbxkb: cannot open X display\n", stderr); return 1; }
    XSetErrorHandler(xerror);
    screen = DefaultScreen(dpy); root = RootWindow(dpy, screen);
    int opcode, error, major = XkbMajorVersion, minor = XkbMinorVersion;
    if (!XkbQueryExtension(dpy, &opcode, &xkb_event, &error, &major, &minor)) {
        fputs("sbxkb: XKB extension unavailable\n", stderr); XCloseDisplay(dpy); return 1;
    }
    char name[64];
    snprintf(name, sizeof name, "_NET_SYSTEM_TRAY_S%d", screen);
    tray_selection = XInternAtom(dpy, name, False);
    snprintf(name, sizeof name, "_SBXKB_S%d", screen);
    singleton = XInternAtom(dpy, name, False);
    control = XCreateSimpleWindow(dpy, root, 0, 0, 1, 1, 0, 0, 0);
    XGrabServer(dpy);
    if (XGetSelectionOwner(dpy, singleton)) {
        XUngrabServer(dpy); fputs("sbxkb: already running on this screen\n", stderr);
        XCloseDisplay(dpy); return 1;
    }
    XSetSelectionOwner(dpy, singleton, control, CurrentTime);
    XUngrabServer(dpy);
    tray_opcode = XInternAtom(dpy, "_NET_SYSTEM_TRAY_OPCODE", False);
    manager_atom = XInternAtom(dpy, "MANAGER", False);
    tray_visual = XInternAtom(dpy, "_NET_SYSTEM_TRAY_VISUAL", False);
    active_atom = XInternAtom(dpy, "_NET_ACTIVE_WINDOW", False);
    rules_atom = XInternAtom(dpy, "_XKB_RULES_NAMES", False);
    wm_state = XInternAtom(dpy, "WM_STATE", False);
    XSelectInput(dpy, root, StructureNotifyMask | PropertyChangeMask);
    unsigned mask = XkbStateNotifyMask | XkbNewKeyboardNotifyMask | XkbMapNotifyMask | XkbNamesNotifyMask;
    XkbSelectEvents(dpy, XkbUseCoreKbd, mask, mask);
    XkbSelectEventDetails(dpy, XkbUseCoreKbd, XkbStateNotify, XkbAllStateComponentsMask, XkbGroupStateMask);
    read_keyboard(); dock();
    signal(SIGINT, stop); signal(SIGTERM, stop);
    long long last_dock = milliseconds();
    while (running) {
        while (running && XPending(dpy)) { XEvent event; XNextEvent(dpy, &event); handle_event(&event); }
        sync_focus();
        long long now = milliseconds();
        if (now - last_dock >= 1000) { dock(); last_dock = now; }
        XFlush(dpy);
        struct pollfd fd = {.fd = ConnectionNumber(dpy), .events = POLLIN};
        if (poll(&fd, 1, 150) < 0 && errno != EINTR) break;
        if (fd.revents & (POLLERR | POLLHUP | POLLNVAL)) break;
    }
    clear_saved();
    for (int i = 0; i < XkbNumKbdGroups; i++) free(groups[i].image.pixels);
    if (icon) XDestroyWindow(dpy, icon);
    if (colormap) XFreeColormap(dpy, colormap);
    XDestroyWindow(dpy, control); XCloseDisplay(dpy);
    return 0;
}
