--- gcc/cp/cfns.h.orig	2015-02-13 08:27:46.000000000 +0200
+++ gcc/cp/cfns.h	2015-02-13 10:23:53.000000000 +0200
@@ -53,6 +53,9 @@
 static unsigned int hash (const char *, unsigned int);
 #ifdef __GNUC__
 __inline
+#ifdef __GNUC_STDC_INLINE__
+__attribute__ ((__gnu_inline__))
+#endif
 #endif
 const char * libc_name_p (const char *, unsigned int);
 /* maximum key range = 391, duplicates = 0 */
@@ -96,7 +99,7 @@
       400, 400, 400, 400, 400, 400, 400, 400, 400, 400,
       400, 400, 400, 400, 400, 400, 400
     };
-  register int hval = len;
+  register int hval = (int)len;
 
   switch (hval)
     {

