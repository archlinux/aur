--- gnat/comfignat.mk	2015-08-30 22:59:02.000000000 +1000
+++ gnat/comfignat.mk-new	2016-07-19 15:04:08.076300036 +1000
@@ -148,7 +148,7 @@
 # breaking the project files.
 # dirgpr takes precedence over relocatable_package.
 
-prefix        = /usr/local
+prefix        = /usr
 exec_prefix   = ${prefix}
 datarootdir   = ${prefix}/share
 localstatedir = ${prefix}/var
