dnl GA_CHECK_LIB_CAIRO : check for cairo library
dnl args :             action-if-yes, action-if-no

AC_DEFUN([GA_CHECK_LIB_CAIRO],
[
  ga_check_cairo="no"
  CAIRO_LIBS=
  CAIRO_CFLAGS=
  CAIRO_LDFLAGS=

  ac_save_LIBS="$LIBS"
  ac_save_CPPFLAGS="$CPPFLAGS"
  ac_save_LDFLAGS="$LDFLAGS"

  ga_pkgconfig_cairo=no
  ga_config_cairo=no

dnl Check for pkg-config 
  PKG_CHECK_MODULES([CAIRO],[cairo],[ga_pkgconfig_cairo=yes])

dnl We found something; check for the header cairo.h, cairo_version
  if test $ga_pkgconfig_cairo = 'yes'; then
     LDFLAGS="$LDFLAGS $CAIRO_LDFLAGS"
     LIBS="$LIBS $CAIRO_LIBS"
     AC_CHECK_HEADER([cairo.h],
     [  AC_CHECK_LIB([cairo], [cairo_version],
        [  ga_check_cairo=yes
        ],
        [
           CAIRO_LDFLAGS=
           CAIRO_LIBS=
           LIBS="$ac_save_LIBS"
           LDFLAGS="$ac_save_LDFLAGS"
        ])
     ],
     [
       CAIRO_CFLAGS=
       CPPFLAGS="$ac_save_CPPFLAGS"
     ])
  fi

  LIBS="$ac_save_LIBS"
  CPPFLAGS="$ac_save_CPPFLAGS"
  LDFLAGS="$ac_save_LDFLAGS"

  if test $ga_check_cairo = 'yes'; then
     m4_if([$1], [], [:], [$1])
  else
     m4_if([$2], [], [:], [$2])
  fi

#  AC_SUBST([CAIRO_LIBS])
#  AC_SUBST([CAIRO_LDFLAGS])
#  AC_SUBST([CAIRO_CFLAGS])
])
