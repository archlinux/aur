dnl GA_CHECK_LIB_SHP : check for shp library
dnl args :             action-if-yes, action-if-no

AC_DEFUN([GA_CHECK_LIB_SHP],
[
  ga_check_shp="no"
  SHP_LIBS=
  SHP_CFLAGS=
  SHP_LDFLAGS=

  ac_save_LIBS="$LIBS"
  ac_save_CPPFLAGS="$CPPFLAGS"
  ac_save_LDFLAGS="$LDFLAGS"

dnl check for the header shp.h, SHPOpen
  AC_CHECK_HEADER([shapefil.h],
  [  AC_CHECK_LIB([shp], [SHPOpen],
     [  ga_check_shp=yes
     ],
     [
        SHP_LDFLAGS=
        SHP_LIBS=
        LIBS="$ac_save_LIBS"
        LDFLAGS="$ac_save_LDFLAGS"
     ])
  ],
  [
    SHP_CFLAGS=
    CPPFLAGS="$ac_save_CPPFLAGS"
  ])

  LIBS="$ac_save_LIBS"
  CPPFLAGS="$ac_save_CPPFLAGS"
  LDFLAGS="$ac_save_LDFLAGS"

  if test $ga_check_shp = 'yes'; then
     m4_if([$1], [], [:], [$1])
  else
     m4_if([$2], [], [:], [$2])
  fi

#  AC_SUBST([SHP_LIBS])
#  AC_SUBST([SHP_LDFLAGS])
#  AC_SUBST([SHP_CFLAGS])
])
