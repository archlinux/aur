--- src/gtk/python/python_support_gtk.c	2015-10-18 02:36:31.203280218 +1100
+++ src/gtk/python/python_support_gtk.c-new	2015-10-18 02:36:41.083280623 +1100
@@ -60,7 +60,7 @@
 #ifdef PYGTK
    return "import pygtk; pygtk.require('2.0'); import gtk";
 #else
-   return "import gi, sys; from gi.repository import Gtk,GObject; sys.modules['gtk']=Gtk; sys.modules['gobject']=GObject";
+   return "import gi, sys; gi.require_version('Gtk', '3.0'); from gi.repository import Gtk,GObject; sys.modules['gtk']=Gtk; sys.modules['gobject']=GObject";
 #endif
 }
 
