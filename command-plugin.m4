command_deps="no"

if test "$enable_command" != ""; then
    if test "$TOOLKIT" != "gtk"; then
		command_deps="no"
		AC_MSG_WARN([command plugin: only supported on UNIX/gtk platforms])
	else 
		# stolen from the original plugin.m4 in abiword-plugins
		AC_CHECK_HEADER(readline/readline.h,[
				AC_CHECK_HEADER(readline/history.h,[
						AC_CHECK_LIB(readline,readline,[
								command_deps="yes"
						],[     AC_CHECK_LIB(readline,rl_initialize,[
										command_deps="yes"

								],,)
						],)
				])
		])
	fi
fi

if test "$enable_command" = "yes" || \
   test "$command_deps" = "yes"; then

if test "$enable_command_builtin" = "yes"; then
AC_MSG_ERROR([command plugin: static linking not supported])
fi

AC_MSG_CHECKING([command plugin: for readline and friends])
if test "$command_deps" != "yes"; then
	AC_MSG_ERROR([no])
else
	AC_MSG_RESULT([yes])
        COMMAND_LIBS="-lreadline -lhistory $COMMAND_LIBS"
fi

test "$enable_command" = "auto" && PLUGINS="$PLUGINS command"

COMMAND_CFLAGS="$COMMAND_CFLAGS "'${PLUGIN_CFLAGS}'
COMMAND_LIBS="$COMMAND_LIBS "'${PLUGIN_LIBS}'

fi

AC_SUBST([COMMAND_CFLAGS])
AC_SUBST([COMMAND_LIBS])

