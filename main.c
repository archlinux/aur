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

#include <gdk/gdk.h>
#include <gtk/gtk.h>
#include <X11/Xlib.h>

#include <stdio.h>
#include <string.h>

static void
printColorAt(GdkDrawable *drawable, gint x, gint y)
{
	GdkImage *pixel = gdk_drawable_get_image(drawable, x, y, 1, 1);

	guint32 color = gdk_image_get_pixel(pixel, 0, 0);

	printf("R: %3d, G: %3d, B: %3d | Hex: #%06X\n",
	       (color >> 0x10) & 0xFF,
	       (color >> 0x08) & 0xFF,
	       (color >> 0x00) & 0xFF,
	       color);

	gdk_image_destroy(pixel);
}

static GdkFilterReturn
region_filter_func(GdkXEvent *xevent, GdkEvent *event, GdkWindow *root)
{
	XEvent *_xevent = (XEvent*) xevent;
	gint x, y;

	if (_xevent->type != ButtonPress)
		return GDK_FILTER_CONTINUE;

	switch (_xevent->xbutton.button)
	{
	case Button1:
		x = _xevent->xbutton.x_root;
		y = _xevent->xbutton.y_root;

		/* Print color */
		printColorAt(GDK_DRAWABLE(root), x, y);
		return GDK_FILTER_CONTINUE;

	default:
		gtk_main_quit();
		return GDK_FILTER_REMOVE;
	}

	return GDK_FILTER_CONTINUE;
}

void main(int argc, char *argv[])
{
	GdkWindow *root;
	GdkCursor *cursor;

	gtk_init(&argc, &argv);

	root = gdk_get_default_root_window();

	cursor = gdk_cursor_new(GDK_TCROSS);

	gdk_pointer_grab(root, FALSE, GDK_BUTTON_PRESS_MASK,
	                 NULL, cursor, GDK_CURRENT_TIME);

	gdk_window_add_filter
		(root, (GdkFilterFunc) region_filter_func, root);

	gdk_flush();

	gtk_main();

	gdk_window_remove_filter
		(root, (GdkFilterFunc) region_filter_func, root);

	gdk_pointer_ungrab(GDK_CURRENT_TIME);

	gdk_cursor_destroy(cursor);
}
