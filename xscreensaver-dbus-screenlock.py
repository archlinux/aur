#!/usr/bin/env python
# Replace gnome-screensaver DBus service to call xscreensaver
# http://ubuntuforums.org/showthread.php?t=1865593&s=1c7f28c50a3f258e1d3404e41f098a0b&p=11418175#post11418175

import dbus
import dbus.service
import dbus.glib
import gobject
import subprocess
 
class ScreenDbusObj(dbus.service.Object):
    def __init__(self):
        session_bus = dbus.SessionBus()
        bus_name=dbus.service.BusName("org.gnome.ScreenSaver",bus=session_bus)
        dbus.service.Object.__init__(self,bus_name, '/org/gnome/ScreenSaver')
 
    @dbus.service.method("org.gnome.ScreenSaver")
    def Lock(self):
        subprocess.Popen(['xscreensaver-command', '-lock'])
 
 
if __name__ == '__main__':
    object=ScreenDbusObj()
    gobject.MainLoop().run()
