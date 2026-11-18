/* SPDX-License-Identifier: GPL-3.0-or-later */
#define main sbxkb_main
#include "../main.c"
#undef main
#include <assert.h>
#include <sys/wait.h>

static pid_t child;
static Window host, embedded;
static int requests, errors;

static int test_error(Display *display, XErrorEvent *event)
{
    char message[256];
    XGetErrorText(display, event->error_code, message, sizeof message);
    fprintf(stderr, "test X error: %s (request %u)\n", message, event->request_code);
    errors++;
    return 0;
}

static void cleanup_child(void)
{
    if (child > 0) {
        int status;
        kill(child, SIGTERM);
        assert(waitpid(child, &status, 0) == child);
        child = 0;
        assert(WIFEXITED(status) && WEXITSTATUS(status) == 0);
    }
}

static void pump(int duration)
{
    long long until = milliseconds() + duration;
    do {
        XSync(dpy, False);
        while (XPending(dpy)) {
            XEvent event;
            XNextEvent(dpy, &event);
            if (event.type == ClientMessage && event.xclient.message_type == tray_opcode &&
                event.xclient.window == host && event.xclient.data.l[1] == 0) {
                embedded = (Window)event.xclient.data.l[2]; requests++;
                XReparentWindow(dpy, embedded, host, 0, 0);
                XResizeWindow(dpy, embedded, 24, 24);
                XMapWindow(dpy, embedded);
                XFlush(dpy);
            }
        }
        struct timespec t = {0, 10000000}; nanosleep(&t, NULL);
    } while (milliseconds() < until);
}

static void start_app(bool global)
{
    child = fork();
    assert(child >= 0);
    if (!child) {
        /* Do not retain the test's X connection across exec. */
        close(ConnectionNumber(dpy));
        if (global) execl("./sbxkb", "sbxkb", "--global", (char *)NULL);
        else execl("./sbxkb", "sbxkb", (char *)NULL);
        _exit(127);
    }
    pump(300);
    assert(kill(child, 0) == 0);
}

static void make_host(bool argb, bool announce)
{
    Visual *v = DefaultVisual(dpy, screen);
    int host_depth = DefaultDepth(dpy, screen);
    if (argb) {
        XVisualInfo info;
        assert(XMatchVisualInfo(dpy, screen, 32, TrueColor, &info));
        v = info.visual; host_depth = info.depth;
    }
    Colormap cmap = XCreateColormap(dpy, root, v, AllocNone);
    XSetWindowAttributes attrs = {.background_pixel = argb ? 0 : 0x345678,
        .border_pixel = 0, .colormap = cmap};
    host = XCreateWindow(dpy, root, 0, 0, 48, 48, 0, host_depth, InputOutput, v,
                         CWBackPixel | CWBorderPixel | CWColormap, &attrs);
    unsigned long id = XVisualIDFromVisual(v);
    XChangeProperty(dpy, host, tray_visual, XA_VISUALID, 32, PropModeReplace, (unsigned char *)&id, 1);
    XSetSelectionOwner(dpy, tray_selection, host, CurrentTime);
    XMapWindow(dpy, host);
    if (announce) {
        XEvent event = {0};
        event.xclient.type = ClientMessage; event.xclient.window = root;
        event.xclient.message_type = manager_atom; event.xclient.format = 32;
        event.xclient.data.l[1] = (long)tray_selection;
        event.xclient.data.l[2] = (long)host;
        XSendEvent(dpy, root, False, StructureNotifyMask, &event);
    }
    XFlush(dpy);
}

static unsigned long pixel(unsigned x, unsigned y)
{
    XImage *image = XGetImage(dpy, embedded, (int)x, (int)y, 1, 1, AllPlanes, ZPixmap);
    assert(image);
    unsigned long result = XGetPixel(image, 0, 0);
    XDestroyImage(image);
    return result;
}

static unsigned group(void)
{
    XkbStateRec state;
    assert(XkbGetState(dpy, XkbUseCoreKbd, &state) == Success);
    return state.group;
}

static void focus_window(Window w)
{
    XSetInputFocus(dpy, w, RevertToPointerRoot, CurrentTime);
    XFlush(dpy); pump(350);
}

static void test_parsing(void)
{
    ngroups = 3;
    const unsigned char valid[] = "evdev\0pc105\0us,ru,custom\0,,\0grp:alt_shift_toggle\0";
    assert(rule_symbols(valid, sizeof valid));
    assert(!strcmp(groups[0].symbol, "us"));
    assert(!strcmp(groups[1].symbol, "ru"));
    assert(!strcmp(groups[2].symbol, "custom"));
    const unsigned char bad[] = "evdev\0pc105\0unterminated";
    assert(!rule_symbols(bad, sizeof bad - 1));
    for (size_t i = 0; i < sizeof valid; i++) (void)rule_symbols(valid, i);
    Image image = {0};
    assert(load_image("images/np.png", &image));
    assert(image.width == 11 && image.height == 14);
    free(image.pixels);
    assert(!load_image("/nonexistent/sbxkb.png", &image));
    puts("PASS bounded layout parsing and PNG loading");
}

int main(void)
{
    setvbuf(stdout, NULL, _IONBF, 0);
    atexit(cleanup_child);
    test_parsing();
    dpy = XOpenDisplay(NULL); assert(dpy);
    XSetErrorHandler(test_error);
    screen = DefaultScreen(dpy); root = RootWindow(dpy, screen);
    tray_selection = XInternAtom(dpy, "_NET_SYSTEM_TRAY_S0", False);
    tray_opcode = XInternAtom(dpy, "_NET_SYSTEM_TRAY_OPCODE", False);
    manager_atom = XInternAtom(dpy, "MANAGER", False);
    tray_visual = XInternAtom(dpy, "_NET_SYSTEM_TRAY_VISUAL", False);
    /* Keep this connection open while setxkbmap exits, so Xvfb retains the map. */
    assert(system("setxkbmap -layout us,ru -option ''") == 0);
    start_app(false);
    assert(requests == 0);
    make_host(false, false); pump(1400);
    assert(requests == 1 && embedded);
    assert(pixel(0, 0) == 0x345678);
    assert(pixel(12, 12) != 0x345678);
    puts("PASS late tray startup without announcement and inherited panel background");

    pid_t duplicate = fork(); assert(duplicate >= 0);
    if (!duplicate) { close(ConnectionNumber(dpy)); execl("./sbxkb", "sbxkb", (char *)NULL); _exit(127); }
    int status; waitpid(duplicate, &status, 0);
    assert(WIFEXITED(status) && WEXITSTATUS(status) == 1);
    puts("PASS duplicate instance protection");

    for (int i = 0; i < 3; i++) {
        int before = requests;
        XDestroyWindow(dpy, host); host = None; embedded = None;
        pump(250);
        make_host(i % 2 == 0, true); pump(500);
        assert(requests == before + 1 && embedded);
        assert(pixel(0, 0) == (i % 2 == 0 ? 0 : 0x345678));
        if (i % 2 == 0) assert((pixel(12, 12) & 0xff000000UL) == 0xff000000UL);
    }
    puts("PASS repeated tray destruction/restart and ARGB transparency");

    int before = requests;
    XDestroyWindow(dpy, embedded); embedded = None; pump(500);
    assert(requests == before + 1 && embedded);
    puts("PASS recovery when the icon alone is destroyed");

    Window a = XCreateSimpleWindow(dpy, root, 80, 0, 60, 60, 0, 0, 0);
    Window b = XCreateSimpleWindow(dpy, root, 150, 0, 60, 60, 0, 0, 0);
    Window child_a = XCreateSimpleWindow(dpy, a, 0, 0, 20, 20, 0, 0, 0);
    XMapWindow(dpy, a); XMapWindow(dpy, b); XMapWindow(dpy, child_a);
    focus_window(a); assert(group() == 0);
    XkbLockGroup(dpy, XkbUseCoreKbd, 1); XFlush(dpy); pump(250); assert(group() == 1);
    focus_window(b); assert(group() == 0);
    focus_window(child_a); assert(group() == 1);
    puts("PASS per-window layouts and child-focus normalization");

    XEvent click = {0};
    click.xbutton.type = ButtonPress; click.xbutton.window = embedded; click.xbutton.button = 1;
    XSendEvent(dpy, embedded, False, ButtonPressMask, &click); XFlush(dpy); pump(250);
    assert(group() == 0);
    click.xbutton.button = 4;
    XSendEvent(dpy, embedded, False, ButtonPressMask, &click); XFlush(dpy); pump(250);
    assert(group() == 1);
    puts("PASS click and scroll layout switching");

    assert(system("setxkbmap -layout de -option ''") == 0); pump(500);
    assert(group() == 0);
    char *title = NULL; assert(XFetchName(dpy, embedded, &title));
    assert(title && strstr(title, "German")); XFree(title);
    puts("PASS live keymap replacement with fewer groups");
    assert(system("setxkbmap -layout np -option ''") == 0); pump(400);
    assert(pixel(18, 2) == 0); /* Transparent tip of the Nepal PNG, inside its bounds. */
    assert((pixel(4, 2) & 0xff000000UL) == 0xff000000UL);
    assert(system("setxkbmap -layout epo -option ''") == 0); pump(400);
    assert(pixel(2, 3) == 0xffffffffUL); /* Unknown flag uses a visible text badge. */
    puts("PASS transparent PNG pixels and missing-flag fallback");
    assert(system("setxkbmap -layout us,ru -option ''") == 0); pump(400);
    cleanup_child();
    start_app(true); pump(250);
    focus_window(a);
    XkbLockGroup(dpy, XkbUseCoreKbd, 1); XFlush(dpy); pump(250);
    focus_window(b); assert(group() == 1);
    puts("PASS global layout mode");
    cleanup_child();
    XDestroyWindow(dpy, host);
    XDestroyWindow(dpy, a); XDestroyWindow(dpy, b);
    XSync(dpy, False);
    assert(errors == 0);
    XCloseDisplay(dpy);
    return 0;
}
