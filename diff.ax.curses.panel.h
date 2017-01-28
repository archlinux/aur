--- macros/ax_with_curses_extra.m4	2017-01-28 14:47:29.776076256 -0700
+++ macros/ax_with_curses_extra.m4	2017-01-28 14:43:41.375965370 -0700
@@ -214,0 +215,3 @@
+            AS_IF([test x$[]ax_cv_[]m4_tolower($1) != "xyes"], [
+		_AX_WITH_CURSES_CHECKEXTRA([$1], [$2], [$3], [$4], [$6])
+            ])
