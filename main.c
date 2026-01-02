/* FastWM v1.0
 * cr4at4d by MLevankov

 * The fast WM for BSD/Linux
*/

#include <X11/Xlib.h>
#include <X11/cursorfont.h>
#include <X11/keysymdef.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

Display* dpy;
XEvent e;
Window w;
Cursor c;
int s;
char* terminal[] = {"st", NULL};
int running = 0;

int
main()
{
	printf("FastWM v1.0\ncr4at4d by MLevankov\n");
	printf("Opening display...\n");
	if (!(dpy = XOpenDisplay(getenv("DISPLAY"))))
	{
		printf("Display not found\n");
		return 1;
	}
	s = DefaultScreen(dpy);
	w = RootWindow(dpy, s);
	XSelectInput(dpy, w, SubstructureRedirectMask | ButtonPressMask | KeyPressMask);
	c = XCreateFontCursor(dpy, XC_left_ptr);
	XDefineCursor(dpy, w, c);
	XFlush(dpy);
	running = 1;
	while (running)
	{
		XNextEvent(dpy, &e);
		switch (e.type)
		{
			case KeyPress:
				/* mod4mask = super */
				if ((e.xkey.state & Mod4Mask) && e.xkey.keycode == 28)
				{
					if (fork() == 0)
					{
						setsid();
						execvp(terminal[0], terminal);
					}
				}
				if ((e.xkey.state & Mod4Mask) && e.xkey.keycode == 24)
				{
					running = 0;
				}
				break;
			case MapRequest:
				XMapWindow(dpy, e.xmaprequest.window);
				break;
		}
	}
	XFreeCursor(dpy, c);
	XCloseDisplay(dpy);
	return 0;
}
