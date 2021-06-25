diff --git i/libxo/xo_syslog.c w/libxo/xo_syslog.c
index 62da181..dbef8cc 100644
--- i/libxo/xo_syslog.c
+++ w/libxo/xo_syslog.c
@@ -58,7 +58,9 @@
 #include <stdarg.h>
 #include <sys/time.h>
 #include <sys/types.h>
+#ifdef HAVE_SYS_SYSCTL_H
 #include <sys/sysctl.h>
+#endif
 
 #include "xo_config.h"
 #include "xo.h"
