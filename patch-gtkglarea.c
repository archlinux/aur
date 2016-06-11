--- src/opengl/gtkglarea.c
+++ src/opengl/gtkglarea.c
@@ -20,6 +20,7 @@
 #include <stdarg.h>
 
 #include "gdkgl.h"
+#define  __GI_SCANNER__
 #include "gtkglarea.h"
 
 static void gtk_gl_area_class_init    (GtkGLAreaClass *klass);

