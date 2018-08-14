dnl GA_CHECK_LIB_GADAP : check for gadap library
dnl args :             action-if-yes, action-if-no

AC_DEFUN([GA_CHECK_LIB_GADAP],
[
  ga_check_gadap="no"
  GADAP_LIBS=
  GADAP_CFLAGS=
  GADAP_LDFLAGS=

  ac_save_LIBS="$LIBS"
  ac_save_CPPFLAGS="$CPPFLAGS"
  ac_save_LDFLAGS="$LDFLAGS"

dnl check for the header gadap.h, gadap_open
  AC_CHECK_HEADER([gadap.h],
  [  AC_CHECK_LIB([gadap], [gadap_open],
     [  ga_check_gadap=yes
     ],
     [
        GADAP_LDFLAGS=
        GADAP_LIBS=
        LIBS="$ac_save_LIBS"
        LDFLAGS="$ac_save_LDFLAGS"
     ])
  ],
  [
    GADAP_CFLAGS=
    CPPFLAGS="$ac_save_CPPFLAGS"
  ])

  LIBS="$ac_save_LIBS"
  CPPFLAGS="$ac_save_CPPFLAGS"
  LDFLAGS="$ac_save_LDFLAGS"

  if test $ga_check_gadap = 'yes'; then
     m4_if([$1], [], [:], [$1])
  else
     m4_if([$2], [], [:], [$2])
  fi

#  AC_SUBST([GADAP_LIBS])
#  AC_SUBST([GADAP_LDFLAGS])
#  AC_SUBST([GADAP_CFLAGS])
])
