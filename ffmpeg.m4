dnl ffmpeg/libav

AC_ARG_WITH(ffmpeg, AS_HELP_STRING([--with-ffmpeg[[=PATH]]],
   [Compile with ffmpeg support from the given prefix]
   [(e.g. --with-ffmpeg=/opt/ffmpeg9)]),
   [with_ffmpeg="$withval"], [with_ffmpeg="yes"])

if test "x$with_ffmpeg" != "xno"
then
	if test "x$with_ffmpeg" != "xyes"
	then
		dnl Prefer a user-specified FFmpeg prefix.
		PKG_CONFIG_PATH="$with_ffmpeg/lib/pkgconfig:$with_ffmpeg/share/pkgconfig:$PKG_CONFIG_PATH"
		export PKG_CONFIG_PATH
	fi

	PKG_CHECK_MODULES(ffmpeg, libavutil libavcodec libavformat,
		[ffmpeg_CPPFLAGS=`$PKG_CONFIG --cflags-only-I libavutil libavcodec libavformat`
		 AC_SUBST(ffmpeg_CPPFLAGS)
		 AC_SUBST(ffmpeg_CFLAGS)
		 AC_SUBST(ffmpeg_LIBS)
		 want_ffmpeg="yes"],
		[true])

	if test "x$want_ffmpeg" = "xyes"
	then
		dnl The plugin requires the AVChannelLayout API introduced
		dnl in FFmpeg 5.1 (libavcodec 59.24.100).
		if $PKG_CONFIG --atleast-version 59.24.100 libavcodec
		then
			DECODER_PLUGINS="$DECODER_PLUGINS ffmpeg"
			AC_DEFINE([HAVE_FFMPEG], 1,
			          [Define to 1 if you know you have FFmpeg.])
		else
			AC_MSG_WARN([libavcodec is too old for the ffmpeg plugin (need FFmpeg >= 5.1); building without it.])
			want_ffmpeg="no"
		fi
	fi
fi

AM_CONDITIONAL([BUILD_ffmpeg], [test "x$want_ffmpeg" = "xyes"])
AC_CONFIG_FILES([decoder_plugins/ffmpeg/Makefile])
