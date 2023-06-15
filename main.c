/* Copyright (c) 2015 Jonas Kulla <Nyocurio@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/*
 * Modified in 2023 by Mistyhands <mistyhands@pm.me>
 * - copy hex to clipboard with "-c" argument
 * - always use oneshot, and always cancel after keypress
 */
#include <X11/cursorfont.h>
#include <X11/Xutil.h>

#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <string.h>

int main(int argc, char *argv[]) {

    int opt;
    int output_format = 0x11;
    int to_clipboard = 0;
    
    static struct option long_options[] = {
        {"one-shot", no_argument, NULL, 'o'},
        {"quit-on-keypress", no_argument, NULL, 'q'},
        {"help", no_argument, NULL, 'h'},
        {"rgb", no_argument, NULL, 'r'},
        {"hex", no_argument, NULL, 'd'},
        {"clipboard", no_argument, NULL, 'c'}
    };
    
    while ((opt = getopt_long(argc, argv, "oqhrdc", long_options, NULL)) != -1) {
        switch(opt) {
            case 'r':
                output_format &= 0x1;
                break;
            case 'd':
                output_format &= 0x10;
                break;
            case 'c':
                to_clipboard = 1;
                break;
            case 'h':
                printf( "colorpicker [options]\n"
                        "  -h, --help:             show this help\n"
                        "  -o, --one-shot:         one shot\n"
                        "  -q, --quit-on-keypress: quit on keypress\n"
                        "  -d, --hex:              hex only\n"
                        "  -r, --rgb:              rgb only\n"
                        "  -c, --clipboard:        copy color to clipboard instead of stdout\n");
                return 0;
            default:
                return 1;
        }
    }

    Display *display = XOpenDisplay(NULL);
    Window root = DefaultRootWindow(display);

    Cursor cursor = XCreateFontCursor(display, 130);
    XGrabPointer(display, root, 0,  ButtonPressMask, GrabModeAsync, GrabModeAsync, root, cursor, CurrentTime);

    XWindowAttributes gwa;
    XGetWindowAttributes(display, root, &gwa);

    XGrabKeyboard(display, root, 0, GrabModeAsync, GrabModeAsync, CurrentTime);

    for(;;) {
        XEvent e;
        XNextEvent(display, &e);
        XImage *image = XGetImage(display, root, 0, 0, gwa.width, gwa.height, AllPlanes, ZPixmap);
        if (e.type == ButtonPress && e.xbutton.button == Button1) {
                unsigned long pixel = XGetPixel(image, e.xbutton.x_root, e.xbutton.y_root);
                char command[256];
                char color[16];
                if (output_format & 0x1) {
                    sprintf(color, "%d,%d,%d", (pixel >> 0x10) & 0xFF, (pixel >> 0x08) & 0xFF, pixel & 0xFF);
                }
                if (output_format & 0x10) {
                    sprintf(color, "#%06X", pixel);
                }
                if (to_clipboard) {
                    sprintf(command, "echo -n '%s'| xclip -selection clipboard", color);
                    system(command);
                } else {
                    printf("%s\n", color);
                }
                break;
        } else if (e.type == ButtonPress || e.type == KeyPress) {
            break;
        }
        XDestroyImage(image);
        fflush(stdout);
    }

    XUngrabPointer(display, CurrentTime);
    XUngrabKeyboard(display, CurrentTime);

    XFreeCursor(display, cursor);
    XDestroyWindow(display, root);
    XCloseDisplay(display);
}

