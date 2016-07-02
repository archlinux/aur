--- aclocal.m4	2016-07-02 04:27:40.575928176 +1000
+++ aclocal.m4-new	2016-07-02 04:27:49.715928551 +1000
@@ -66,7 +66,7 @@
    gprinstall=gprinstall
    AC_SUBST(gprinstall)
 
-   gprbuild=gprbuild
+   gprbuild=gnatmake
    AC_SUBST(gprbuild)
 
    if test x$GNAT_BUILDS_SHARED = xyes; then
