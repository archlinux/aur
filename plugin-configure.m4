
HRTEXT_CFLAGS=
HRTEXT_LIBS=

if test "$enable_hrtext" != ""; then

test "$enable_hrtext" = "auto" && PLUGINS="$PLUGINS hrtext"

HRTEXT_CFLAGS="$HRTEXT_CFLAGS "'${PLUGIN_CFLAGS}'
HRTEXT_LIBS="$HRTEXT_LIBS "'${PLUGIN_LIBS}'

if test "$enable_hrtext_builtin" = "yes"; then
	HRTEXT_CFLAGS="$HRTEXT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([HRTEXT_CFLAGS])
AC_SUBST([HRTEXT_LIBS])


GOOGLE_CFLAGS=
GOOGLE_LIBS=

if test "$enable_google" != ""; then

test "$enable_google" = "auto" && PLUGINS="$PLUGINS google"

GOOGLE_CFLAGS="$GOOGLE_CFLAGS "'${PLUGIN_CFLAGS}'
GOOGLE_LIBS="$GOOGLE_LIBS "'${PLUGIN_LIBS}'

if test "$enable_google_builtin" = "yes"; then
	GOOGLE_CFLAGS="$GOOGLE_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([GOOGLE_CFLAGS])
AC_SUBST([GOOGLE_LIBS])


BMP_CFLAGS=
BMP_LIBS=
bmp_deps="no"

if test "$enable_bmp" != ""; then

   bmp_deps="yes"

fi

if test "$enable_bmp" = "yes" || \
   test "$bmp_deps" = "yes"; then

# TODO check for libpng, well abiword links to it anyways

BMP_CFLAGS="$BMP_CFLAGS $PNG_CFLAGS "'${PLUGIN_CFLAGS}'
BMP_LIBS="$BMP_LIBS $PNG_LIBS "'${PLUGIN_LIBS}'

if test "$enable_bmp_builtin" = "yes"; then
	BMP_CFLAGS="$BMP_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

test "$enable_bmp" = "auto" && PLUGINS="$PLUGINS bmp"

fi

AC_SUBST([BMP_CFLAGS])
AC_SUBST([BMP_LIBS])


xslfo_pkgs="$gsf_req"
xslfo_deps="no"

if test "$enable_xslfo" != ""; then

PKG_CHECK_EXISTS([ $xslfo_pkgs ], 
[
	xslfo_deps="yes"
], [
	test "$enable_xslfo" = "auto" && AC_MSG_WARN([xslfo plugin: dependencies not satisfied - $xslfo_pkgs])
])

fi

if test "$enable_xslfo" = "yes" || \
   test "$xslfo_deps" = "yes"; then

PKG_CHECK_MODULES(XSLFO,[ $xslfo_pkgs ])

test "$enable_xslfo" = "auto" && PLUGINS="$PLUGINS xslfo"

XSLFO_CFLAGS="$XSLFO_CFLAGS "'${PLUGIN_CFLAGS}'
XSLFO_LIBS="$XSLFO_LIBS "'${PLUGIN_LIBS}'

if test "$enable_xslfo_builtin" = "yes"; then
	XSLFO_CFLAGS="$XSLFO_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([XSLFO_CFLAGS])
AC_SUBST([XSLFO_LIBS])


pdf_pkgs="$gsf_req"
pdf_deps="no"

PDF_CFLAGS=
PDF_LIBS=

if test "$enable_pdf" != ""; then

PKG_CHECK_EXISTS([ $pdf_pkgs ], 
[
	pdf_deps="yes"
], [
	test "$enable_pdf" = "auto" && AC_MSG_WARN([pdf plugin: dependencies not satisfied - $pdf_pkgs])
])

fi

if test "$enable_pdf" = "yes" || \
   test "$pdf_deps" = "yes"; then

PKG_CHECK_MODULES(PDF,[ $pdf_pkgs ])

test "$enable_pdf" = "auto" && PLUGINS="$PLUGINS pdf"

PDF_CFLAGS="$PDF_CFLAGS "'${PLUGIN_CFLAGS}'
PDF_LIBS="$PDF_LIBS "'${PLUGIN_LIBS}'

if test "$enable_pdf_builtin" = "yes"; then
	PDF_CFLAGS="$PDF_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([PDF_CFLAGS])
AC_SUBST([PDF_LIBS])


PASSEPARTOUT_CFLAGS=
PASSEPARTOUT_LIBS=

if test "$enable_passepartout" != ""; then

test "$enable_passepartout" = "auto" && PLUGINS="$PLUGINS passepartout"

PASSEPARTOUT_CFLAGS="$PASSEPARTOUT_CFLAGS "'${PLUGIN_CFLAGS}'
PASSEPARTOUT_LIBS="$PASSEPARTOUT_LIBS "'${PLUGIN_LIBS}'

if test "$enable_passepartout_builtin" = "yes"; then
	PASSEPARTOUT_CFLAGS="$PASSEPARTOUT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([PASSEPARTOUT_CFLAGS])
AC_SUBST([PASSEPARTOUT_LIBS])


EML_CFLAGS=
EML_LIBS=

if test "$enable_eml" != ""; then

test "$enable_eml" = "auto" && PLUGINS="$PLUGINS eml"

EML_CFLAGS="$EML_CFLAGS "'${PLUGIN_CFLAGS}'
EML_LIBS="$EML_LIBS "'${PLUGIN_LIBS}'

if test "$enable_eml_builtin" = "yes"; then
	EML_CFLAGS="$EML_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([EML_CFLAGS])
AC_SUBST([EML_LIBS])


wordperfect_pkgs="libwpd-0.10 $gsf_req"
wordperfect_wps_pkgs='libwps-0.3'
wordperfect_deps="no"

WORDPERFECT_CFLAGS=
WORDPERFECT_LIBS=
WPS_DEFINE=

if test "$enable_wordperfect" != ""; then

PKG_CHECK_EXISTS([ $wordperfect_pkgs ], 
[
	wordperfect_deps="yes"
], [
	test "$enable_wordperfect" = "auto" && AC_MSG_WARN([wordperfect plugin: dependencies not satisfied - $wordperfect_pkgs])
])

fi

if test "$enable_wordperfect" = "yes" || \
   test "$wordperfect_deps" = "yes"; then

if test "$enable_wordperfect_builtin" = "yes"; then
AC_MSG_ERROR([wordperfect plugin: static linking not supported])
fi

wp_deps_pkgs="$wordperfect_pkgs"

PKG_CHECK_EXISTS([ $wordperfect_wps_pkgs ],
[
	wp_deps_pkgs="$wordperfect_wps_pkgs $wp_deps_pkgs"
	WPS_DEFINE=" -DHAVE_LIBWPS"
])

PKG_CHECK_MODULES(WORDPERFECT,[ $wp_deps_pkgs ])

test "$enable_wordperfect" = "auto" && PLUGINS="$PLUGINS wordperfect"

WORDPERFECT_CFLAGS="$WORDPERFECT_CFLAGS "'${PLUGIN_CFLAGS}'"$WPS_DEFINE"
WORDPERFECT_LIBS="$WORDPERFECT_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([WORDPERFECT_CFLAGS])
AC_SUBST([WORDPERFECT_LIBS])


AC_ARG_WITH([psiconv-config],
	[AS_HELP_STRING([--with-psiconv-config=DIR], [use psiconv-config in DIR])],
[
	AC_PATH_PROG(psiconvconfig, psiconv-config, , "$withval")
], [
	AC_PATH_PROG(psiconvconfig, psiconv-config)
])

# The required psiconv version, as reported by psiconv-config
psiconv_major_req=0
psiconv_minor_req=9
psiconv_micro_req=4
psion_deps="no"

if test "$enable_psion" != ""; then

	if test "$psiconvconfig" = ""; then
		if test "$enable_psion" = "yes"; then
		  AC_MSG_ERROR([psiconv plugin: program psiconv-config not found in path])
		else
		  AC_MSG_WARN([psiconv plugin: program psiconv-config not found in path])
		fi
	else
		IFS_old="$IFS"
		IFS='.'
		set -- `$psiconvconfig --version`
		psiconv_major_found="${1}"
		psiconv_minor_found="${2}"
		psiconv_micro_found="${3}"
		IFS="$IFS_old"
		if test "$psiconv_major_found" -gt "$psiconv_major_req"; then
			psion_deps="yes"
		elif test "$psiconv_major_found" -eq "$psiconv_major_req" &&
		     test "$psiconv_minor_found" -gt "$psiconv_minor_req"; then
			psion_deps="yes"
		elif test "$psiconv_major_found" -eq "$psiconv_major_req" &&
		     test "$psiconv_minor_found" -eq "$psiconv_minor_req" &&
		     test "$psiconv_micro_found" -ge "$psiconv_micro_req"; then
			psion_deps="yes"
		fi
	fi
fi

if test "$enable_psion" = "yes" || \
   test "$psion_deps" = "yes"; then

if test "$enable_psion_builtin" = "yes"; then
AC_MSG_ERROR([psion plugin: static linking not supported])
fi

AC_MSG_CHECKING([for psiconv >= ${psiconv_major_req}.${psiconv_minor_req}.${psiconv_micro_req}])
if test "$psion_deps" = "yes"; then
	AC_MSG_RESULT([version ${psiconv_major_found}.${psiconv_minor_found}.${psiconv_micro_found} (ok)])
	PSION_CFLAGS=`$psiconvconfig --cflags`
	PSION_LIBS=`$psiconvconfig --libs`
else
	AC_MSG_ERROR([version ${psiconv_major_found}.${psiconv_minor_found}.${psiconv_micro_found} (too old!)])
fi

test "$enable_psion" = "auto" && PLUGINS="$PLUGINS psion"

PSION_CFLAGS="$PSION_CFLAGS $PNG_CFLAGS "'${PLUGIN_CFLAGS}'
PSION_LIBS="$PSION_LIBS $PNG_LIBS -lgsf-1 "'${PLUGIN_LIBS}'

fi

AC_SUBST([PSION_CFLAGS])
AC_SUBST([PSION_LIBS])


rsvg_pkgs="librsvg-2.0 >= 2.0 glib-2.0"
rsvg_deps="no"

if test "$TOOLKIT" = "gtk"; then
 
 if test "$enable_rsvg" = "auto"; then
   AC_MSG_WARN([rsvg plugin: not needed with gtk])
 fi
 enable_rsvg=""
fi

if test "$enable_rsvg" != ""; then

PKG_CHECK_EXISTS([ $rsvg_pkgs ], 
[
	rsvg_deps="yes"
], [
	test "$enable_rsvg" = "auto" && AC_MSG_WARN([rsvg plugin: dependencies not satisfied - $rsvg_pkgs])
])

fi

if test "$enable_rsvg" = "yes" || \
   test "$rsvg_deps" = "yes"; then

if test "$enable_rsvg_builtin" = "yes"; then
AC_MSG_ERROR([rsvg plugin: static linking not supported])
fi

PKG_CHECK_MODULES(RSVG,[ $rsvg_pkgs ])

test "$enable_rsvg" = "auto" && PLUGINS="$PLUGINS rsvg"

RSVG_CFLAGS="$RSVG_CFLAGS "'${PLUGIN_CFLAGS}'
RSVG_LIBS="$RSVG_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([RSVG_CFLAGS])
AC_SUBST([RSVG_LIBS])


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


S5_CFLAGS=
S5_LIBS=

if test "$enable_s5" != ""; then

test "$enable_s5" = "auto" && PLUGINS="$PLUGINS s5"

S5_CFLAGS="$S5_CFLAGS "'${PLUGIN_CFLAGS}'
S5_LIBS="$S5_LIBS "'${PLUGIN_LIBS}'

if test "$enable_s5_builtin" = "yes"; then
	S5_CFLAGS="$S5_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([S5_CFLAGS])
AC_SUBST([S5_LIBS])


sdw_pkgs="$gsf_req"
sdw_deps="no"

if test "$enable_sdw" != ""; then

PKG_CHECK_EXISTS([ $sdw_pkgs ], 
[
	sdw_deps="yes"
], [
	test "$enable_sdw" = "auto" && AC_MSG_WARN([sdw plugin: dependencies not satisfied - $sdw_pkgs])
])

fi

if test "$enable_sdw" = "yes" || \
   test "$sdw_deps" = "yes"; then

PKG_CHECK_MODULES(SDW,[ $sdw_pkgs ])

test "$enable_sdw" = "auto" && PLUGINS="$PLUGINS sdw"

SDW_CFLAGS="$SDW_CFLAGS "'${PLUGIN_CFLAGS}'
SDW_LIBS="$SDW_LIBS "'${PLUGIN_LIBS}'

if test "$enable_sdw_builtin" = "yes"; then
	SDW_CFLAGS="$SDW_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([SDW_CFLAGS])
AC_SUBST([SDW_LIBS])


OPML_CFLAGS=
OPML_LIBS=

if test "$enable_opml" != ""; then

test "$enable_opml" = "auto" && PLUGINS="$PLUGINS opml"

OPML_CFLAGS="$OPML_CFLAGS "'${PLUGIN_CFLAGS}'
OPML_LIBS="$OPML_LIBS "'${PLUGIN_LIBS}'

if test "$enable_opml_builtin" = "yes"; then
	OPML_CFLAGS="$OPML_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([OPML_CFLAGS])
AC_SUBST([OPML_LIBS])


garble_pkgs="libgsf-1 >= 1.12 libxml-2.0 >= 2.4.0"
garble_deps="no"

if test "$enable_garble" != ""; then

PKG_CHECK_EXISTS([ $garble_pkgs ], 
[
	garble_deps="yes"
], [
	test "$enable_garble" = "auto" && AC_MSG_WARN([garble plugin: dependencies not satisfied - $garble_pkgs])
])

fi

if test "$enable_garble" = "yes" || \
   test "$garble_deps" = "yes"; then

AC_HEADER_TIME

PKG_CHECK_MODULES(GARBLE,[ $garble_pkgs ])

test "$enable_garble" = "auto" && PLUGINS="$PLUGINS garble"

GARBLE_CFLAGS="$GARBLE_CFLAGS $PNG_CFLAGS "'${PLUGIN_CFLAGS}'
GARBLE_LIBS="$GARBLE_LIBS $PNG_LIBS "'${PLUGIN_LIBS}'

if test "$enable_garble_builtin" = "yes"; then
	GARBLE_CFLAGS="$GARBLE_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([GARBLE_CFLAGS])
AC_SUBST([GARBLE_LIBS])


grammar_pkgs='patronus >= 0.1.0'
grammar_deps="no"

dnl make sure we enable grammar only if spell is enabled. At least in auto mode.
if test "$enable_grammar" != "" && test  "$abi_cv_spell" = "yes"; then

PKG_CHECK_EXISTS([ $grammar_pkgs ], 
[
	grammar_deps="yes"
], [
	test "$enable_grammar" = "auto" && AC_MSG_WARN([grammar plugin: dependencies not satisfied - $grammar_pkgs])
])

fi

if test "$enable_grammar" = "yes" || \
   test "$grammar_deps" = "yes"; then

if test "$enable_grammar_builtin" = "yes"; then
AC_MSG_ERROR([grammar plugin: static linking not supported])
fi

PKG_CHECK_MODULES(GRAMMAR,[ $grammar_pkgs ])

test "$enable_grammar" = "auto" && PLUGINS="$PLUGINS grammar"

GRAMMAR_CFLAGS="$GRAMMAR_CFLAGS "'${PLUGIN_CFLAGS}'
GRAMMAR_LIBS="$GRAMMAR_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([GRAMMAR_CFLAGS])
AC_SUBST([GRAMMAR_LIBS])


LATEX_CFLAGS=
LATEX_LIBS=

# use libxslt if detected
libxslt_req='libxslt'
PKG_CHECK_EXISTS([ $libxslt_req ],
[
	abi_cv_libxslt="yes"
], [
	abi_cv_libxslt="no"
])
AM_CONDITIONAL([HAVE_LIBXSLT], test "$abi_cv_libxslt" = "yes")

if test "$enable_latex" != ""; then

test "$enable_latex" = "auto" && PLUGINS="$PLUGINS latex"

if test "$abi_cv_libxslt" = "yes"; then
	PKG_CHECK_MODULES(LIBXSLT,[$libxslt_req])
	LATEX_CFLAGS="$LATEX_CFLAGS "'${LIBXSLT_CFLAGS}'" -DHAVE_LIBXSLT"
	LATEX_LIBS="$LATEX_LIBS "'${LIBXSLT_LIBS}'
	AC_SUBST(ABIWORD_XSLTMLDIR, "${ABIWORD_DATADIR}/xsltml")
	PKG_CHECK_MODULES(LIBGSF, libgsf-1)
	LATEX_CFLAGS="$LATEX_CFLAGS "'${LIBGSF_CFLAGS}'
	LATEX_LIBS="$LATEX_LIBS "'${LIBGSF_LIBS}'
fi

LATEX_CFLAGS="$LATEX_CFLAGS "'${PLUGIN_CFLAGS}'
LATEX_LIBS="$LATEX_LIBS "'${PLUGIN_LIBS}'

if test "$enable_latex_builtin" = "yes"; then
	LATEX_CFLAGS="$LATEX_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([LATEX_CFLAGS])
AC_SUBST([LATEX_LIBS])


epub_pkgs="libgsf-1 >= 1.14.4"
epub_deps="no"

if test "$enable_epub" != ""; then

PKG_CHECK_EXISTS([ $epub_pkgs ], 
[
	epub_deps="yes"
	], [
	test "$enable_epub" = "auto" && AC_MSG_WARN([epub plugin: dependencies not satisfied - $epub_pkgs])
])

fi

if test "$enable_epub" = "yes" || \
   test "$epub_deps" = "yes"; then

PKG_CHECK_MODULES(EPUB,[ $epub_pkgs ])

test "$enable_epub" = "auto" && PLUGINS="$PLUGINS epub"

EPUB_CFLAGS="$EPUB_CFLAGS "'${PLUGIN_CFLAGS}'
EPUB_LIBS="$EPUB_LIBS "'${PLUGIN_LIBS}'

if test "$enable_epub_builtin" = "yes"; then
	EPUB_CFLAGS="$EPUB_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([EPUB_CFLAGS])
AC_SUBST([EPUB_LIBS])


WIKIPEDIA_CFLAGS=
WIKIPEDIA_LIBS=

if test "$enable_wikipedia" != ""; then

test "$enable_wikipedia" = "auto" && PLUGINS="$PLUGINS wikipedia"

WIKIPEDIA_CFLAGS="$WIKIPEDIA_CFLAGS "'${PLUGIN_CFLAGS}'
WIKIPEDIA_LIBS="$WIKIPEDIA_LIBS "'${PLUGIN_LIBS}'

if test "$enable_wikipedia_builtin" = "yes"; then
	WIKIPEDIA_CFLAGS="$WIKIPEDIA_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([WIKIPEDIA_CFLAGS])
AC_SUBST([WIKIPEDIA_LIBS])


GIMP_CFLAGS=
GIMP_LIBS=

if test "$enable_gimp" != ""; then

test "$enable_gimp" = "auto" && PLUGINS="$PLUGINS gimp"

GIMP_CFLAGS="$GIMP_CFLAGS "'${PLUGIN_CFLAGS}'
GIMP_LIBS="$GIMP_LIBS "'${PLUGIN_LIBS}'

if test "$enable_gimp_builtin" = "yes"; then
	GIMP_CFLAGS="$GIMP_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([GIMP_CFLAGS])
AC_SUBST([GIMP_LIBS])


#opendocument_pkgs="$gsf_req redland >= 1.0.10 rasqal >= 0.9.17"

opendocument_pkgs="$gsf_req"
opendocument_optional_pkgs="redland >= 1.0.10 rasqal >= 0.9.17"
opendocument_deps="no"

if test "$enable_opendocument" != ""; then

PKG_CHECK_EXISTS([ $opendocument_pkgs ], 
[
	opendocument_deps="yes"
], [
	test "$enable_opendocument" = "auto" && AC_MSG_WARN([opendocument plugin: dependencies not satisfied - $opendocument_pkgs])
])

PKG_CHECK_EXISTS([ $opendocument_optional_pkgs ], 
[ opendocument_pkgs="$opendocument_pkgs $opendocument_optional_pkgs" ])

fi

if test "$enable_opendocument" = "yes" || \
   test "$opendocument_deps" = "yes"; then

PKG_CHECK_MODULES(OPENDOCUMENT,[ $opendocument_pkgs ])

test "$enable_opendocument" = "auto" && PLUGINS="$PLUGINS opendocument"

OPENDOCUMENT_CFLAGS="$OPENDOCUMENT_CFLAGS "'${PLUGIN_CFLAGS}'
OPENDOCUMENT_LIBS="$OPENDOCUMENT_LIBS "'${PLUGIN_LIBS} -lz'

if test "$enable_opendocument_builtin" = "yes"; then
	OPENDOCUMENT_CFLAGS="$OPENDOCUMENT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([OPENDOCUMENT_CFLAGS])
AC_SUBST([OPENDOCUMENT_LIBS])


PAINT_CFLAGS=
PAINT_LIBS=

if test "$enable_paint" != ""; then

test "$enable_paint" = "auto" && PLUGINS="$PLUGINS paint"

# TODO check for libpng
if test "$TOOLKIT" = "win"; then
	PAINT_LIBS="-lgdi32 $PNG_LIBS"
	PAINT_CFLAGS="$PAINT_CFLAGS $PNG_CFLAGS"
fi

PAINT_CFLAGS="$PAINT_CFLAGS "'${PLUGIN_CFLAGS}'
PAINT_LIBS="$PAINT_LIBS "'${PLUGIN_LIBS}'

if test "$enable_paint_builtin" = "yes"; then
	PAINT_CFLAGS="$PAINT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([PAINT_CFLAGS])
AC_SUBST([PAINT_LIBS])


mswrite_pkgs="$gsf_req"
mswrite_deps="no"

if test "$enable_mswrite" != ""; then

PKG_CHECK_EXISTS([ $mswrite_pkgs ], 
[
	mswrite_deps="yes"
], [
	test "$enable_mswrite" = "auto" && AC_MSG_WARN([mswrite plugin: dependencies not satisfied - $mswrite_pkgs])
])

fi

if test "$enable_mswrite" = "yes" || \
   test "$mswrite_deps" = "yes"; then

PKG_CHECK_MODULES(MSWRITE,[ $mswrite_pkgs ])

test "$enable_mswrite" = "auto" && PLUGINS="$PLUGINS mswrite"

MSWRITE_CFLAGS="$MSWRITE_CFLAGS "'${PLUGIN_CFLAGS}'
MSWRITE_LIBS="$MSWRITE_LIBS "'${PLUGIN_LIBS}'

if test "$enable_mswrite_builtin" = "yes"; then
	MSWRITE_CFLAGS="$MSWRITE_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([MSWRITE_CFLAGS])
AC_SUBST([MSWRITE_LIBS])


AC_ARG_WITH([libwmf-config],
	[AS_HELP_STRING([--with-libwmf-config=DIR], [use libwmf-config in DIR])],
[
	AC_PATH_PROG(libwmfconfig, libwmf-config, , "$withval")
], [
	AC_PATH_PROG(libwmfconfig, libwmf-config)
])

# The required libwmf version, as reported by libwmf-config
libwmf_major_req=0
libwmf_minor_req=2
libwmf_micro_req=8
wmf_deps="no"

if test "$enable_wmf" != ""; then

	if test "$libwmfconfig" = ""; then
		if test "$enable_wmf" = "yes"; then
		  AC_MSG_ERROR([wmf plugin: program libwmf-config not found in path])
		else
		  AC_MSG_WARN([wmf plugin: program libwmf-config not found in path])
		fi
	else
		IFS_old="$IFS"
		IFS='.'
		set -- `$libwmfconfig --version`
		libwmf_major_found="${1}"
		libwmf_minor_found="${2}"
		libwmf_micro_found="${3}"
		IFS="$IFS_old"
		if test "$libwmf_major_found" -gt "$libwmf_major_req"; then
			wmf_deps="yes"
		elif test "$libwmf_major_found" -eq "$libwmf_major_req" &&
		     test "$libwmf_minor_found" -gt "$libwmf_minor_req"; then
			wmf_deps="yes"
		elif test "$libwmf_major_found" -eq "$libwmf_major_req" &&
		     test "$libwmf_minor_found" -eq "$libwmf_minor_req" &&
		     test "$libwmf_micro_found" -ge "$libwmf_micro_req"; then
			wmf_deps="yes"
		fi
	fi
fi

if test "$enable_wmf" = "yes" || \
   test "$wmf_deps" = "yes"; then

if test "$enable_wmf_builtin" = "yes"; then
AC_MSG_ERROR([wmf plugin: static linking not supported])
fi

AC_MSG_CHECKING([for libwmf >= ${libwmf_major_req}.${libwmf_minor_req}.${libwmf_micro_req}])
if test "$wmf_deps" = "yes"; then
	AC_MSG_RESULT([version ${libwmf_major_found}.${libwmf_minor_found}.${libwmf_micro_found} (ok)])
	WMF_CFLAGS=`$libwmfconfig --cflags`
	WMF_LIBS=`$libwmfconfig --libs`
else
	AC_MSG_ERROR([version ${libwmf_major_found}.${libwmf_minor_found}.${libwmf_micro_found} (too old!)])
fi

test "$enable_wmf" = "auto" && PLUGINS="$PLUGINS wmf"

WMF_CFLAGS="$WMF_CFLAGS "'${PLUGIN_CFLAGS}'
WMF_LIBS="$WMF_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([WMF_CFLAGS])
AC_SUBST([WMF_LIBS])


MIF_CFLAGS=
MIF_LIBS=

if test "$enable_mif" != ""; then

test "$enable_mif" = "auto" && PLUGINS="$PLUGINS mif"

MIF_CFLAGS="$MIF_CFLAGS "'${PLUGIN_CFLAGS}'
MIF_LIBS="$MIF_LIBS "'${PLUGIN_LIBS}'

if test "$enable_mif_builtin" = "yes"; then
	MIF_CFLAGS="$MIF_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([MIF_CFLAGS])
AC_SUBST([MIF_LIBS])


FREETRANSLATION_CFLAGS=
FREETRANSLATION_LIBS=

if test "$enable_freetranslation" != ""; then

test "$enable_freetranslation" = "auto" && PLUGINS="$PLUGINS freetranslation"

FREETRANSLATION_CFLAGS="$FREETRANSLATION_CFLAGS "'${PLUGIN_CFLAGS}'
FREETRANSLATION_LIBS="$FREETRANSLATION_LIBS "'${PLUGIN_LIBS}'

if test "$enable_freetranslation_builtin" = "yes"; then
	FREETRANSLATION_CFLAGS="$FREETRANSLATION_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([FREETRANSLATION_CFLAGS])
AC_SUBST([FREETRANSLATION_LIBS])


ots_pkgs="libots-1 >= 0.5.0"
ots_deps="no"

if test "$enable_ots" != ""; then

PKG_CHECK_EXISTS([ $ots_pkgs ], 
[
	ots_deps="yes"
], [
	test "$enable_ots" = "auto" && AC_MSG_WARN([ots plugin: dependencies not satisfied - $ots_pkgs])
])

fi

if test "$enable_ots" = "yes" || \
   test "$ots_deps" = "yes"; then

test "$enable_ots" = "auto" && PLUGINS="$PLUGINS ots"

if test "$enable_ots_builtin" = "yes"; then
AC_MSG_ERROR([ots plugin: static linking not supported])
fi

PKG_CHECK_MODULES(OTS,[ $ots_pkgs ])

OTS_CFLAGS="$OTS_CFLAGS "'${PLUGIN_CFLAGS}'
OTS_LIBS="$OTS_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([OTS_CFLAGS])
AC_SUBST([OTS_LIBS])


wpg_pkgs="libwpg-0.3 $gsf_req"
wpg_deps="no"

if test "$enable_wpg" != ""; then

PKG_CHECK_EXISTS([ $wpg_pkgs ], 
[
	wpg_deps="yes"
], [
	test "$enable_wpg" = "auto" && AC_MSG_WARN([wpg plugin: dependencies not satisfied - $wpg_pkgs])
])

fi

if test "$enable_wpg" = "yes" || \
   test "$wpg_deps" = "yes"; then

if test "$enable_wpg_builtin" = "yes"; then
AC_MSG_ERROR([wpg plugin: static linking not supported])
fi

PKG_CHECK_MODULES(WPG, [ $wpg_pkgs ])

test "$enable_wpg" = "auto" && PLUGINS="$PLUGINS wpg"

WPG_CFLAGS="$WPG_CFLAGS "'${PLUGIN_CFLAGS}'
WPG_LIBS="$WPG_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([WPG_CFLAGS])
AC_SUBST([WPG_LIBS])


kword_pkgs="$gsf_req"
kword_deps="no"

if test "$enable_kword" != ""; then

PKG_CHECK_EXISTS([ $kword_pkgs ], 
[
	kword_deps="yes"
], [
	test "$enable_kword" = "auto" && AC_MSG_WARN([kword plugin: dependencies not satisfied - $kword_pkgs])
])

fi

if test "$enable_kword" = "yes" || \
   test "$kword_deps" = "yes"; then

PKG_CHECK_MODULES(KWORD,[ $kword_pkgs ])

test "$enable_kword" = "auto" && PLUGINS="$PLUGINS kword"

KWORD_CFLAGS="$KWORD_CFLAGS "'${PLUGIN_CFLAGS}'
KWORD_LIBS="$KWORD_LIBS "'${PLUGIN_LIBS}'

if test "$enable_kword_builtin" != ""; then
	KWORD_CFLAGS="$KWORD_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([KWORD_CFLAGS])
AC_SUBST([KWORD_LIBS])


GDICT_CFLAGS=
GDICT_LIBS=
gdict_deps="no"

if test "$enable_gdict" != ""; then

AC_MSG_CHECKING([for unix/gtk platform])
if test "$TOOLKIT" = "gtk"; then
  AC_MSG_RESULT([yes])
  gdict_deps="yes"
else
  AC_MSG_RESULT([no])
  if test "$enable_gdict" = "auto"; then
    AC_MSG_WARN([gdict plugin: only supported on UNIX/gtk platforms])
  else
    AC_MSG_ERROR([gdict plugin: only supported on UNIX/gtk platforms])
  fi
fi

fi

if test "$enable_gdict" = "yes" || \
   test "$gdict_deps" = "yes"; then

AC_TYPE_PID_T

test "$enable_gdict" = "auto" && PLUGINS="$PLUGINS gdict"

GDICT_CFLAGS="$GDICT_CFLAGS "'${PLUGIN_CFLAGS} -DUSE_FORK_AND_EXEC_METHOD=1'
GDICT_LIBS='${PLUGIN_LIBS}'

if test "$enable_gdict_builtin" != ""; then
	GDICT_CFLAGS="$GDICT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([GDICT_CFLAGS])
AC_SUBST([GDICT_LIBS])


collab_req="libgsf-1 >= 1.12 libxml-2.0 >= 2.4.0"
collab_telepathy_req="dbus-glib-1 >= 0.70 telepathy-glib >= 0.14.5"
if test "$TOOLKIT_IS_GTK2" = "yes"; then
collab_xmpp_req="loudmouth-1.0 >= 1.3.2 gtk+-2.0"
else
collab_xmpp_req="loudmouth-1.0 >= 1.3.2 gtk+-3.0"
fi
collab_sugar_req="dbus-glib-1 >= 0.70"
collab_service_req="libsoup-2.4 gnutls"
collab_pkgs="$collab_req" 	# accumulate required packages

AC_ARG_ENABLE([collab-backend-fake], 
    [AS_HELP_STRING([--enable-collab-backend-fake], [Fake backend for debugging purposes only (default: off)])], 
[
	enable_collab_backend_fake=$enableval
], [
	enable_collab_backend_fake="no"
])
AC_MSG_CHECKING([for collab fake backend])
AC_MSG_RESULT([$enable_collab_backend_fake])


AC_ARG_ENABLE([collab-backend-telepathy], 
    [AS_HELP_STRING([--enable-collab-backend-telepathy], [Telepathy backend (default: auto)])], 
[
	enable_collab_backend_telepathy=$enableval
], [
	PKG_CHECK_EXISTS([ $collab_telepathy_req ],
	[
	    enable_collab_backend_telepathy="yes"
	], [
	    enable_collab_backend_telepathy="no"
	])
])
test "$enable_collab_backend_telepathy" = "yes" && collab_pkgs="$collab_pkgs $collab_telepathy_req"
AC_MSG_CHECKING([for collab telepathy backend])
AC_MSG_RESULT([$enable_collab_backend_telepathy])

AC_ARG_ENABLE([collab-backend-xmpp], 
    [AS_HELP_STRING([--enable-collab-backend-xmpp], [Jabber backend (default: auto)])], 
[
	enable_collab_backend_xmpp=$enableval
], [
	PKG_CHECK_EXISTS([ $collab_xmpp_req ],
	[
		enable_collab_backend_xmpp="yes"
	], [
		enable_collab_backend_xmpp="no"
	])
])
test "$enable_collab_backend_xmpp" = "yes" && collab_pkgs="$collab_pkgs $collab_xmpp_req"
AC_MSG_CHECKING([for collab xmpp backend])
AC_MSG_RESULT([$enable_collab_backend_xmpp])

AC_ARG_ENABLE([collab-backend-tcp], 
    [AS_HELP_STRING([--enable-collab-backend-tcp], [TCP backend (default: auto)])], 
[
	enable_collab_backend_tcp=$enableval
	if test "$enable_collab_backend_tcp" != "no"; then
		AC_LANG_PUSH(C++)
		AC_CHECK_HEADERS([asio.hpp], [], 
		[
			AC_MSG_ERROR([collab plugin: asio is required for the collab plugin TCP backend, see http://think-async.com/])
		])
		AC_LANG_POP
	fi
], [
	AC_LANG_PUSH(C++)
	AC_CHECK_HEADERS([asio.hpp], 
	[
		enable_collab_backend_tcp="yes"
	])
	AC_LANG_POP
])
AC_MSG_CHECKING([for collab tcp backend])
AC_MSG_RESULT([$enable_collab_backend_tcp])

AC_ARG_ENABLE([collab-backend-sugar], 
    [AS_HELP_STRING([--enable-collab-backend-sugar], [Sugar/OLPC backend (default: auto)])], 
[
	enable_collab_backend_sugar=$enableval
], [
	PKG_CHECK_EXISTS([ $collab_sugar_req ],
	[
		enable_collab_backend_sugar="yes"
	], [
		enable_collab_backend_sugar="no"
	])
])
test "$enable_collab_backend_sugar" = "yes" && collab_pkgs="$collab_pkgs $collab_sugar_req"
AC_MSG_CHECKING([for collab sugar backend])
AC_MSG_RESULT([$enable_collab_backend_sugar])

AC_ARG_ENABLE([collab-backend-service], 
    [AS_HELP_STRING([--enable-collab-backend-service], [abicollab.net backend (default: auto)])], 
[
	enable_collab_backend_service=$enableval
	if test "$enable_collab_backend_service" != "no"; then
		AC_LANG_PUSH(C++)
		AC_CHECK_HEADERS([asio.hpp], [], 
		[
			AC_MSG_ERROR([collab plugin: asio is required for the the abicollab.net backend, see http://think-async.com/])
		])
		AC_LANG_POP
	fi
], [
	AC_LANG_PUSH(C++)
	AC_CHECK_HEADERS([asio.hpp],
	[
		enable_collab_backend_service="yes"
	])
	AC_LANG_POP
])
test "$enable_collab_backend_service" = "yes" && collab_pkgs="$collab_pkgs $collab_service_req"
AC_MSG_CHECKING([for collab service backend])
AC_MSG_RESULT([$enable_collab_backend_service])

AC_ARG_ENABLE([collab-backend-sip], 
    [AS_HELP_STRING([--enable-collab-backend-sip], [Experimental SIP backend (default: off)])], 
[
	enable_collab_backend_sipsimple=$enableval
], [
	enable_collab_backend_sipsimple="no"
])
AC_MSG_CHECKING([for collab sip backend])
AC_MSG_RESULT([$enable_collab_backend_sipsimple])

AC_ARG_ENABLE([collab-record-always], 
    [AS_HELP_STRING([--enable-collab-record-always], [Always record AbiCollab sessions (default: off)])], 
[
	enable_collab_record_always=$enableval
], [
	enable_collab_record_always="no"
])
AC_MSG_CHECKING([for collab always recording backend])
AC_MSG_RESULT([$enable_collab_record_always])

collab_deps="no"

if test "$enable_collab" != ""; then

PKG_CHECK_EXISTS([ $collab_pkgs ], 
[
	collab_deps="yes"
])

fi

if test "$enable_collab" = "yes" || \
   test "$collab_deps" = "yes"; then

if test "$enable_collab_builtin" = "yes"; then
AC_MSG_ERROR([collab plugin: static linking not supported])
fi

PKG_CHECK_MODULES(COLLAB,[ $collab_pkgs ])

if test "$enable_collab_backend_fake" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_FAKE"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_FAKE"
fi
if test "$enable_collab_backend_telepathy" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_TELEPATHY"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_TELEPATHY"
fi
if test "$enable_collab_backend_xmpp" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_XMPP"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_XMPP"
fi
if test "$enable_collab_backend_tcp" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_TCP"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_TCP"
fi
if test "$enable_collab_backend_sugar" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_SUGAR"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_SUGAR"
fi
if test "$enable_collab_backend_service" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_SERVICE -DSOUP24"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_SERVICE"
fi
if test "$enable_collab_backend_sipsimple" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_HANDLER_SIPSIMPLE"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_HANDLER_SIPSIMPLE"
fi
if test "$enable_collab_record_always" = "yes"; then
	COLLAB_CFLAGS="$COLLAB_CFLAGS -DABICOLLAB_RECORD_ALWAYS"
	COLLAB_RCFLAGS="$COLLAB_RCFLAGS -DABICOLLAB_RECORD_ALWAYS"
fi

if test "$enable_collab_backend_tcp" = "yes" || \
   test "$enable_collab_backend_service" = "yes"; then
	COLLAB_LIBS="$COLLAB_LIBS -lgcrypt"
	if test "$TOOLKIT" != "win"; then
		COLLAB_LIBS="$COLLAB_LIBS -lpthread"
	fi
fi


test "$enable_collab" = "auto" && PLUGINS="$PLUGINS collab"

COLLAB_CFLAGS="$COLLAB_CFLAGS "'${PLUGIN_CFLAGS}'
COLLAB_LIBS="$COLLAB_LIBS "'${PLUGIN_LIBS}'

fi # plugin conditional

AM_CONDITIONAL([COLLAB_BACKEND_FAKE], [test "$enable_collab_backend_fake" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_TELEPATHY], [test "$enable_collab_backend_telepathy" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_XMPP], [test "$enable_collab_backend_xmpp" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_TCP], [test "$enable_collab_backend_tcp" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_SUGAR], [test "$enable_collab_backend_sugar" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_SERVICE], [test "$enable_collab_backend_service" = "yes"])
AM_CONDITIONAL([COLLAB_BACKEND_SIPSIMPLE], [test "$enable_collab_backend_sipsimple" = "yes"])
AM_CONDITIONAL([COLLAB_RECORD_ALWAYS], [test "$enable_collab_record_always" = "yes"])

AC_SUBST([COLLAB_CFLAGS])
AC_SUBST([COLLAB_RCFLAGS])
AC_SUBST([COLLAB_LIBS])


ISCII_CFLAGS=
ISCII_LIBS=

if test "$enable_iscii" != ""; then

test "$enable_iscii" = "auto" && PLUGINS="$PLUGINS iscii"

ISCII_CFLAGS="$ISCII_CFLAGS "'${PLUGIN_CFLAGS}'
ISCII_LIBS="$ISCII_LIBS "'${PLUGIN_LIBS}'

if test "$enable_iscii_builtin" = "yes"; then
	ISCII_CFLAGS="$ISCII_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([ISCII_CFLAGS])
AC_SUBST([ISCII_LIBS])


goffice_req=
for ver in 0.10 ; do
  if test "x$goffice_req" = x; then
    if pkg-config --exists libgoffice-$ver; then
      goffice_req=libgoffice-$ver
    fi
  fi
done
if test "x$goffice_req" = x; then
  goffice_req=libgoffice-0.10
fi

goffice_pkgs="$goffice_req >= 0.10.2"
goffice_deps="no"

if test "$enable_goffice" != ""; then

PKG_CHECK_EXISTS([ $goffice_pkgs ], 
[
	AC_MSG_CHECKING([for gtk toolkit])
	if test "$TOOLKIT" = "gtk"; then
	  AC_MSG_RESULT([yes])
	  goffice_deps="yes"
	else
	  AC_MSG_RESULT([no])
	  if test "$enable_goffice" = "auto"; then
	    AC_MSG_WARN([goffice plugin: only supported with gtk])
	  else
	    AC_MSG_ERROR([goffice plugin: only supported with gtk])
	  fi
	fi
], [
	test "$enable_goffice" = "auto" && AC_MSG_WARN([goffice plugin: dependencies not satisfied - $goffice_pkgs])
])

fi

if test "$enable_goffice" = "yes" || \
   test "$goffice_deps" = "yes"; then

if test "$enable_goffice_builtin" = "yes"; then
AC_MSG_ERROR([goffice plugin: static linking not supported])
fi

PKG_CHECK_MODULES(GOFFICE,[ $goffice_pkgs ])

test "$enable_goffice" = "auto" && PLUGINS="$PLUGINS goffice"

GOFFICE_CFLAGS="$GOFFICE_CFLAGS "'${PLUGIN_CFLAGS}'
GOFFICE_LIBS="$GOFFICE_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([GOFFICE_CFLAGS])
AC_SUBST([GOFFICE_LIBS])


pdb_pkgs="$gsf_req"
pdb_deps="no"

if test "$enable_pdb" != ""; then

PKG_CHECK_EXISTS([ $pdb_pkgs ], 
[
	pdb_deps="yes"
], [
	test "$enable_pdb" = "auto" && AC_MSG_WARN([pdb plugin: dependencies not satisfied - $pdb_pkgs])
])

fi

if test "$enable_pdb" = "yes" || \
   test "$pdb_deps" = "yes"; then

PKG_CHECK_MODULES(PDB,[ $pdb_pkgs ])

test "$enable_pdb" = "auto" && PLUGINS="$PLUGINS pdb"

PDB_CFLAGS="$PDB_CFLAGS "'${PLUGIN_CFLAGS}'
PDB_LIBS="$PDB_LIBS "'${PLUGIN_LIBS}'

if test "$enable_pdb_builtin" = "yes"; then
	PDB_CFLAGS="$PDB_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([PDB_CFLAGS])
AC_SUBST([PDB_LIBS])


openwriter_pkgs="$gsf_req"
openwriter_deps="no"

if test "$enable_openwriter" != ""; then

PKG_CHECK_EXISTS([ $openwriter_pkgs ], 
[
	openwriter_deps="yes"
], [
	test "$enable_openwriter" = "auto" && AC_MSG_WARN([openwriter plugin: dependencies not satisfied - $openwriter_pkgs])
])

fi

if test "$enable_openwriter" = "yes" || \
   test "$openwriter_deps" = "yes"; then

PKG_CHECK_MODULES(OPENWRITER,[ $openwriter_pkgs ])

test "$enable_openwriter" = "auto" && PLUGINS="$PLUGINS openwriter"

OPENWRITER_CFLAGS="$OPENWRITER_CFLAGS "'${PLUGIN_CFLAGS}'
OPENWRITER_LIBS="$OPENWRITER_LIBS "'${PLUGIN_LIBS}'

if test "$enable_openwriter_builtin" = "yes"; then
	OPENWRITER_CFLAGS="$OPENWRITER_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([OPENWRITER_CFLAGS])
AC_SUBST([OPENWRITER_LIBS])


t602_pkgs="$gsf_req"
t602_deps="no"

if test "$enable_t602" != ""; then

PKG_CHECK_EXISTS([ $t602_pkgs ], 
[
	t602_deps="yes"
], [
	test "$enable_t602" = "auto" && AC_MSG_WARN([t602 plugin: dependencies not satisfied - $t602_pkgs])
])

fi

if test "$enable_t602" = "yes" || \
   test "$t602_deps" = "yes"; then

PKG_CHECK_MODULES(T602,[ $t602_pkgs ])

test "$enable_t602" = "auto" && PLUGINS="$PLUGINS t602"

T602_CFLAGS="$T602_CFLAGS "'${PLUGIN_CFLAGS}'
T602_LIBS="$T602_LIBS "'${PLUGIN_LIBS}'

if test "$enable_t602_builtin" = "yes"; then
	T602_CFLAGS="$T602_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([T602_CFLAGS])
AC_SUBST([T602_LIBS])


PRESENTATION_CFLAGS=
PRESENTATION_LIBS=

if test "$enable_presentation" != ""; then

test "$enable_presentation" = "auto" && PLUGINS="$PLUGINS presentation"

PRESENTATION_CFLAGS="$PRESENTATION_CFLAGS "'${PLUGIN_CFLAGS}'
PRESENTATION_LIBS="$PRESENTATION_LIBS "'${PLUGIN_LIBS}'

if test "$enable_presentation_builtin" = "yes"; then
	PRESENTATION_CFLAGS="$PRESENTATION_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([PRESENTATION_CFLAGS])
AC_SUBST([PRESENTATION_LIBS])


mathview_pkgs='mathview-frontend-libxml2 >= 0.7.5'
mathview_deps="no"

# test hashmap availablity
HASHMAP_CFLAGS=""
AC_LANG(C++)
AC_CHECK_HEADER(hash_map,
[
	HASHMAP_CFLAGS="-DHAVE_HASH_MAP"
], [
	AC_CHECK_HEADER(ext/hash_map,
	[
		HASHMAP_CFLAGS="-DHAVE_EXT_HASH_MAP"
	], [
		AC_MSG_WARN([mathview plugin: dependencies not satisfied - missing 'hash_map' or 'ext/hash_map' header])
	])
])
AC_LANG(C)

if test "$HASHMAP_CFLAGS" != ""; then

if test "$enable_mathview" != ""; then

PKG_CHECK_EXISTS([ $mathview_pkgs ], 
[
	mathview_deps="yes"
], [
	test "$enable_mathview" = "auto" && AC_MSG_WARN([mathview plugin: dependencies not satisfied - $mathview_pkgs])
])

fi

if test "$enable_mathview" = "yes" || \
   test "$mathview_deps" = "yes"; then

if test "$enable_mathview_builtin" = "yes"; then
AC_MSG_ERROR([mathview plugin: static linking not supported])
fi

PKG_CHECK_MODULES(MATHVIEW,[ $mathview_pkgs ])

test "$enable_mathview" = "auto" && PLUGINS="$PLUGINS mathview"

MATHVIEW_CFLAGS="$MATHVIEW_CFLAGS $HASHMAP_CFLAGS "'${PLUGIN_CFLAGS}'
MATHVIEW_LIBS="$MATHVIEW_LIBS "'${PLUGIN_LIBS}'

fi

fi

# need to unconditionally test, for `make distcheck'
AM_PROG_LEX
AC_PROG_YACC

AC_SUBST([MATHVIEW_CFLAGS])
AC_SUBST([MATHVIEW_LIBS])


openxml_pkgs="libgsf-1 >= 1.14.4"
openxml_deps="no"

if test "$enable_openxml" != ""; then

PKG_CHECK_EXISTS([ $openxml_pkgs ], 
[
	openxml_deps="yes"
	], [
	test "$enable_openxml" = "auto" && AC_MSG_WARN([openxml plugin: dependencies not satisfied - $openxml_pkgs])
])

AC_SUBST(ABIWORD_OMMLXSLTDIR, "${ABIWORD_DATADIR}/omml_xslt")

fi

if test "$enable_openxml" = "yes" || \
   test "$openxml_deps" = "yes"; then

PKG_CHECK_MODULES(OPENXML,[ $openxml_pkgs ])

test "$enable_openxml" = "auto" && PLUGINS="$PLUGINS openxml"

OPENXML_CFLAGS="$OPENXML_CFLAGS "'${PLUGIN_CFLAGS}'
OPENXML_LIBS="$OPENXML_LIBS "'${PLUGIN_LIBS}'

if test "$enable_openxml_builtin" = "yes"; then
	OPENXML_CFLAGS="$OPENXML_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([OPENXML_CFLAGS])
AC_SUBST([OPENXML_LIBS])


gda_pkgs='libgda >= 1.2.0 libgnomedb >= 1.2.0'
gda_deps="no"

if test "$enable_gda" != ""; then

PKG_CHECK_EXISTS([ $gda_pkgs ], 
[
	AC_MSG_CHECKING([for gtk toolkit])
	if test "$TOOLKIT" = "gtk"; then
	  AC_MSG_RESULT([yes])
	  gda_deps="yes"
	else
	  AC_MSG_RESULT([no])
	  if test "$enable_gda" = "auto"; then
	    AC_MSG_WARN([gda plugin: only supported with gtk])
	  else
	    AC_MSG_ERROR([gda plugin: only supported with gtk])
	  fi
	fi
], [
	test "$enable_gda" = "auto" && AC_MSG_WARN([gda plugin: dependencies not satisfied - $gda_pkgs])
])

fi

if test "$enable_gda" = "yes" || \
   test "$gda_deps" = "yes"; then

if test "$enable_gda_builtin" = "yes"; then
AC_MSG_ERROR([gda plugin: static linking not supported])
fi

PKG_CHECK_MODULES(GDA,[ $gda_pkgs ])

test "$enable_gda" = "auto" && PLUGINS="$PLUGINS gda"

GDA_CFLAGS="$GDA_CFLAGS "'${PLUGIN_CFLAGS}'
GDA_LIBS="$GDA_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([GDA_CFLAGS])
AC_SUBST([GDA_LIBS])


wml_pkgs="$gsf_req"
wml_deps="no"

if test "$enable_wml" != ""; then

PKG_CHECK_EXISTS([ $wml_pkgs ], 
[
	wml_deps="yes"
], [
	test "$enable_wml" = "auto" && AC_MSG_WARN([wml plugin: dependencies not satisfied - $wml_pkgs])
])

fi

if test "$enable_wml" = "yes" || \
   test "$wml_deps" = "yes"; then

PKG_CHECK_MODULES(WML,[ $wml_pkgs ])

test "$enable_wml" = "auto" && PLUGINS="$PLUGINS wml"

WML_CFLAGS="$WML_CFLAGS "'${PLUGIN_CFLAGS}'
WML_LIBS="$WML_LIBS "'${PLUGIN_LIBS}'

if test "$enable_wml_builtin" = "yes"; then
	WML_CFLAGS="$WML_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([WML_CFLAGS])
AC_SUBST([WML_LIBS])


#
# Optional packages
#

AC_ARG_WITH([inter7eps], 
	[AS_HELP_STRING([--with-inter7eps], [MHT plugin: support multipart html using the inter7 EPS library])], 
[
	mht_cv_inter7eps="$withval"
],[
	mht_cv_inter7eps="auto"
])

AC_ARG_WITH([libtidy], 
	[AS_HELP_STRING([--with-libtidy], [MHT plugin: clean up HTML before importing using libtidy])], 
[
	mht_cv_libtidy="$withval"
],[
	mht_cv_libtidy="auto"
])

# gsf pulls in libxml, so we are ok
mht_pkgs="$gsf_req"
mht_deps="no"

if test "$enable_mht" != ""; then

PKG_CHECK_EXISTS([ $mht_pkgs ], 
[
	mht_deps="yes"
], [
	test "$enable_mht" = "auto" && AC_MSG_WARN([mht plugin: dependencies not satisfied - $mht_pkgs])
])

fi

if test "$enable_mht" = "yes" || \
   test "$mht_deps" = "yes"; then

test "$enable_mht" = "auto" && PLUGINS="$PLUGINS mht"

if test "$enable_mht_builtin" = "yes"; then
AC_MSG_ERROR([mht plugin: static linking not supported])
fi

#
# Tests
#

AC_CHECK_HEADERS([eps/eps.h],
[
	inter7eps_found="yes"
], [
	inter7eps_found="no"
])

AC_CHECK_HEADERS([tidy/tidy.h],
[
	libtidy_found="yes"
], [
	libtidy_found="no"
])

#
# Settings
#

if test "$mht_cv_inter7eps" = "yes" &&
   test "$inter7eps_found" = "no"; then
	AC_MSG_ERROR([MHT plugin: error - inter7 EPS headers not found])
elif test "$mht_cv_inter7eps" = "auto"; then
	mht_cv_inter7eps="$inter7eps_found"
fi
if test "$mht_cv_inter7eps" = "yes"; then
	MHT_OPT_LIBS="$MHT_OPT_LIBS -leps"
fi

if test "$mht_cv_libtidy" = "yes" &&
   test "$libtidy_found" = "no"; then
	AC_MSG_ERROR([MHT plugin: error - libtidy headers not found])
elif test "$mht_cv_libtidy" = "auto"; then
	mht_cv_libtidy="$libtidy_found"
fi
if test "$mht_cv_libtidy" = "yes"; then
	MHT_OPT_LIBS="$MHT_OPT_LIBS -ltidy"
fi

PKG_CHECK_MODULES(MHT,[ $mht_pkgs ])

MHT_CFLAGS="$MHT_CFLAGS "'${PLUGIN_CFLAGS}'
MHT_LIBS="$MHT_LIBS $MHT_OPT_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([MHT_CFLAGS])
AC_SUBST([MHT_LIBS])

# TODO we depend on libxml2 anyways, so get rid of alternatives
AM_CONDITIONAL([ABI_XHTML_XML2], test /bin/true)
AM_CONDITIONAL([ABI_XHTML_MHT], test "$mht_cv_inter7eps" = "yes")
AM_CONDITIONAL([ABI_XHTML_TIDY], test "$mht_cv_libtidy" = "yes")


applix_pkgs="$gsf_req"
applix_deps="no"

if test "$enable_applix" != ""; then

PKG_CHECK_EXISTS([ $applix_pkgs ], 
[
	applix_deps="yes"
], [
	test "$enable_applix" = "auto" && AC_MSG_WARN([applix plugin: dependencies not satisfied - $applix_pkgs])
])

fi

if test "$enable_applix" = "yes" || \
   test "$applix_deps" = "yes"; then

PKG_CHECK_MODULES(APPLIX,[ $applix_pkgs ])

test "$enable_applix" = "auto" && PLUGINS="$PLUGINS applix"

APPLIX_CFLAGS="$APPLIX_CFLAGS "'${PLUGIN_CFLAGS}'
APPLIX_LIBS="$APPLIX_LIBS "'${PLUGIN_LIBS}'

if test "$enable_applix_builtin" = "yes"; then
	APPLIX_CFLAGS="$APPLIX_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([APPLIX_CFLAGS])
AC_SUBST([APPLIX_LIBS])


loadbindings_pkgs="$gsf_req"
loadbindings_deps="no"

if test "$enable_loadbindings" != ""; then

PKG_CHECK_EXISTS([ $loadbindings_pkgs ], 
[
	loadbindings_deps="yes"
], [
	test "$enable_loadbindings" = "auto" && AC_MSG_WARN([loadbindings plugin: dependencies not satisfied - $loadbindings_pkgs])
])

fi

if test "$enable_loadbindings" = "yes" || \
   test "$loadbindings_deps" = "yes"; then

PKG_CHECK_MODULES(LOADBINDINGS,[ $loadbindings_pkgs ])

test "$enable_loadbindings" = "auto" && PLUGINS="$PLUGINS loadbindings"

LOADBINDINGS_CFLAGS="$LOADBINDINGS_CFLAGS "'${PLUGIN_CFLAGS}'
LOADBINDINGS_LIBS="$LOADBINDINGS_LIBS "'${PLUGIN_LIBS}'

if test "$enable_loadbindings_builtin" = "yes"; then
	LOADBINDINGS_CFLAGS="$LOADBINDINGS_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([LOADBINDINGS_CFLAGS])
AC_SUBST([LOADBINDINGS_LIBS])


URLDICT_CFLAGS=
URLDICT_LIBS=

if test "$enable_urldict" != ""; then

test "$enable_urldict" = "auto" && PLUGINS="$PLUGINS urldict"

URLDICT_CFLAGS="$URLDICT_CFLAGS "'${PLUGIN_CFLAGS}'
URLDICT_LIBS="$URLDICT_LIBS "'${PLUGIN_LIBS}'

if test "$enable_urldict_builtin" = "yes"; then
	URLDICT_CFLAGS="$URLDICT_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([URLDICT_CFLAGS])
AC_SUBST([URLDICT_LIBS])


clarisworks_pkgs="$gsf_req"
clarisworks_deps="no"

if test "$enable_clarisworks" != ""; then

PKG_CHECK_EXISTS([ $clarisworks_pkgs ], 
[
	clarisworks_deps="yes"
], [
	test "$enable_clarisworks" = "auto" && AC_MSG_WARN([clarisworks plugin: dependencies not satisfied - $clarisworks_pkgs])
])

fi

if test "$enable_clarisworks" = "yes" || \
   test "$clarisworks_deps" = "yes"; then

PKG_CHECK_MODULES(CLARISWORKS,[ $clarisworks_pkgs ])

test "$enable_clarisworks" = "auto" && PLUGINS="$PLUGINS clarisworks"

CLARISWORKS_CFLAGS="$CLARISWORKS_CFLAGS "'${PLUGIN_CFLAGS}'
CLARISWORKS_LIBS="$CLARISWORKS_LIBS "'${PLUGIN_LIBS}'

if test "$enable_clarisworks_builtin" = "yes"; then
	CLARISWORKS_CFLAGS="$CLARISWORKS_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([CLARISWORKS_CFLAGS])
AC_SUBST([CLARISWORKS_LIBS])


docbook_pkgs="$gsf_req"
docbook_deps="no"

if test "$enable_docbook" != ""; then

PKG_CHECK_EXISTS([ $docbook_pkgs ], 
[
	docbook_deps="yes"
], [
	test "$enable_docbook" = "auto" && AC_MSG_WARN([docbook plugin: dependencies not satisfied - $docbook_pkgs])
])

fi

if test "$enable_docbook" = "yes" || \
   test "$docbook_deps" = "yes"; then

AC_HEADER_TIME

PKG_CHECK_MODULES(DOCBOOK,[ $docbook_pkgs ])

test "$enable_docbook" = "auto" && PLUGINS="$PLUGINS docbook"

DOCBOOK_CFLAGS="$DOCBOOK_CFLAGS "'${PLUGIN_CFLAGS}'
DOCBOOK_LIBS="$DOCBOOK_LIBS "'${PLUGIN_LIBS}'

if test "$enable_docbook_builtin" = "yes"; then
	DOCBOOK_CFLAGS="$DOCBOOK_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([DOCBOOK_CFLAGS])
AC_SUBST([DOCBOOK_LIBS])


hancom_pkgs="$gsf_req"
hancom_deps="no"

if test "$enable_hancom" != ""; then

PKG_CHECK_EXISTS([ $hancom_pkgs ], 
[
	hancom_deps="yes"
], [
	test "$enable_hancom" = "auto" && AC_MSG_WARN([hancom plugin: dependencies not satisfied - $hancom_pkgs])
])

fi

if test "$enable_hancom" = "yes" || \
   test "$hancom_deps" = "yes"; then

PKG_CHECK_MODULES(HANCOM,[ $hancom_pkgs ])

test "$enable_hancom" = "auto" && PLUGINS="$PLUGINS hancom"

HANCOM_CFLAGS="$HANCOM_CFLAGS "'${PLUGIN_CFLAGS}'
HANCOM_LIBS="$HANCOM_LIBS "'${PLUGIN_LIBS}'

if test "$enable_hancom_builtin" = "yes"; then
	HANCOM_CFLAGS="$HANCOM_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([HANCOM_CFLAGS])
AC_SUBST([HANCOM_LIBS])


BABELFISH_CFLAGS=
BABELFISH_LIBS=

if test "$enable_babelfish" != ""; then

test "$enable_babelfish" = "auto" && PLUGINS="$PLUGINS babelfish"

BABELFISH_CFLAGS="$BABELFISH_CFLAGS "'${PLUGIN_CFLAGS}'
BABELFISH_LIBS="$BABELFISH_LIBS "'${PLUGIN_LIBS}'

if test "$enable_babelfish_builtin" = "yes"; then
	BABELFISH_CFLAGS="$BABELFISH_CFLAGS -DABI_PLUGIN_BUILTIN"
fi

fi

AC_SUBST([BABELFISH_CFLAGS])
AC_SUBST([BABELFISH_LIBS])

