--- Makefile.in	2005-04-23 16:43:23.000000000 -0600
+++ Makefile.in	2025-04-01 10:53:57.176777119 -0600
@@ -271,0 +272 @@
+	echo '#include <stdlib.h>' >>temp.c
@@ -273 +274 @@
-	echo '"#define SQLITE_PTR_SZ %d",sizeof(char*));' >>temp.c
+	echo '"#define SQLITE_PTR_SZ %lu",sizeof(char*));' >>temp.c
