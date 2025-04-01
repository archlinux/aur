--- main.mk	2005-04-23 16:43:23.000000000 -0600
+++ main.mk	2025-04-01 10:57:04.410224497 -0600
@@ -242,0 +243 @@
+	echo '#include <stdlib.h>' >>temp.c
@@ -244 +245 @@
-	echo '"#define SQLITE_PTR_SZ %d",sizeof(char*));' >>temp.c
+	echo '"#define SQLITE_PTR_SZ %lu",sizeof(char*));' >>temp.c
