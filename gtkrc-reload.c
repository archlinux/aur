/*
 *   An utility to reload the gtkrc configuration at runtime
 *
 *   Copyright (C) 2010 speps <dreamspepser at yahoo dot it>
 *
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

/*   Version 0.0.1   */

#include <gdk/gdk.h>

static void reload();

int main(int argc, char *argv[]) {

    gdk_init(&argc,&argv);
    reload();
}

static void reload()
{
    GdkEventClient event;
    event.type = GDK_CLIENT_EVENT;
    event.send_event = TRUE;
    event.window = NULL;

    event.message_type = gdk_atom_intern("_GTK_READ_RCFILES", FALSE);

    event.data_format = 8;
    gdk_event_send_clientmessage_toall((GdkEvent *)&event);
}
