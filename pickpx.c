#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>
#include <X11/Xutil.h>

int main(int argc, char *argv[]) {
    if (argc != 3) {
        fprintf(stderr, "Usage: %s <x> <y>\n", argv[0]);
        return 1;
    }

    int x = atoi(argv[1]);
    int y = atoi(argv[2]);

    Display *display = XOpenDisplay(NULL);
    if (display == NULL) {
        fprintf(stderr, "Unable to open display.\n");
        return 1;
    }

    Window root = DefaultRootWindow(display);
    XImage *image = XGetImage(display, root, x, y, 1, 1, AllPlanes, ZPixmap);
    if (image == NULL) {
        fprintf(stderr, "Unable to get image.\n");
        XCloseDisplay(display);
        return 1;
    }

    unsigned long pixel = XGetPixel(image, 0, 0);
    int red = (pixel & image->red_mask) >> 16;
    int green = (pixel & image->green_mask) >> 8;
    int blue = (pixel & image->blue_mask);

    printf("#%02x%02x%02x\n", red, green, blue);

    XDestroyImage(image);
    XCloseDisplay(display);

    return 0;
}

