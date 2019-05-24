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

#include <X11/cursorfont.h>
#include <X11/Xutil.h>

#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[]) {

	int opt;
	int short_format = 0;
	int one_shot = 0;
	int quit_on_keypress = 0;
	while ((opt = getopt(argc, argv, "soqh")) != -1) {
		switch(opt) {
			case 's':
				short_format = 1;
				break;
			case 'o':
				one_shot = 1;
				break;
			case 'q':
				quit_on_keypress = 1;
				break;
			case 'h':
				printf( "colorpicker [options]\n"
						"  -h: show this help\n"
						"  -s: use short format\n"
						"  -o: oneshot\n"
						"  -q: quit on keyboard press\n");
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

	XImage *image = XGetImage(display, root, 0, 0, gwa.width, gwa.height, AllPlanes, ZPixmap);
	XGrabKeyboard(display, root, 0, GrabModeAsync, GrabModeAsync, CurrentTime);

	for(;;) {
		XEvent e;
		XNextEvent(display, &e);
		if (e.type == ButtonPress) {
			if  (e.xbutton.button == Button1) {
				unsigned long pixel = XGetPixel(image, e.xbutton.x_root, e.xbutton.y_root);
				if (short_format) {
					printf("#%06X\n", pixel);
				} else {
					printf("R: %3d, G: %3d, B: %3d | Hex: #%06X\n",
							(pixel >> 0x10) & 0xFF,
							(pixel >> 0x08) & 0xFF,
							(pixel >> 0x00) & 0xFF,
							pixel);
				}
				if (one_shot) {
					break;
				}
			} else  {
				break;
			}
		} else if (e.type == KeyPress && (e.xkey.keycode == 53 || quit_on_keypress)) {
			break;
		}
	}

	/* will be done on connection close anw */
	XUngrabPointer(display, CurrentTime);
	XUngrabKeyboard(display, CurrentTime);
	XFreeCursor(display, cursor);
	XDestroyImage(image);
	XCloseDisplay(display);
}
