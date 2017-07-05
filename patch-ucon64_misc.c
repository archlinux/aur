--- ucon64_misc.c.orig	2017-07-05 21:00:01.742106829 +0200
+++ ucon64_misc.c	2017-07-05 21:00:31.738646663 +0200
@@ -1180,7 +1180,7 @@
 #elif   defined __APPLE__                       // Mac OS X actually
         PROPERTY_MODE_DIR ("ucon64") "discmage.dylib",
 #elif   defined __unix__ || defined __BEOS__
-        PROPERTY_MODE_DIR ("ucon64") "discmage.so",
+        "/usr/lib/discmage.so",
 #else
         "",
 #endif
