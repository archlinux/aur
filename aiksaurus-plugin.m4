
aiksaurus_pkgs="aiksaurus-1.0"
aiksaurus_gtk_pkgs="aiksaurusgtk3-1.0"
aiksaurus_deps="no"

if test "$enable_aiksaurus" != ""; then

PKG_CHECK_EXISTS([ $aiksaurus_pkgs ], 
[
  aiksaurus_deps="yes"
], [
	test "$enable_aiksaurus" = "auto" && AC_MSG_WARN([aiksaurus plugin: dependencies not satisfied - $aiksaurus_pkgs])
])

fi

if test "$enable_aiksaurus" = "yes" || \
   test "$aiksaurus_deps" = "yes"; then

use_builtin_aiksaurus_gtk="no"
if test "$TOOLKIT" = "gtk"; then
PKG_CHECK_EXISTS([ $aiksaurus_gtk_pkgs ], 
[
  aiksaurus_pkgs="$aiksaurus_pkgs $aiksaurus_gtk_pkgs"
], [use_builtin_aiksaurus_gtk="yes"])
fi

if test "$enable_aiksaurus_builtin" = "yes"; then
AC_MSG_ERROR([aiksaurus plugin: static linking not supported])
fi

PKG_CHECK_MODULES(AIKSAURUS,[ $aiksaurus_pkgs ])

  
test "$enable_aiksaurus" = "auto" && PLUGINS="$PLUGINS aiksaurus"

AIKSAURUS_CFLAGS="$AIKSAURUS_CFLAGS "'${PLUGIN_CFLAGS}'
AIKSAURUS_LIBS="$AIKSAURUS_LIBS "'${PLUGIN_LIBS}'

fi

AM_CONDITIONAL([WITH_BUILTIN_AIKSAURUS_GTK],[ test "x$use_builtin_aiksaurus_gtk" = "xyes" ])

AC_SUBST([AIKSAURUS_CFLAGS])
AC_SUBST([AIKSAURUS_LIBS])

