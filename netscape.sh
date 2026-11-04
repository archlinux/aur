#!/bin/sh
# Launcher for Netscape Communicator 4.79

export MOZILLA_HOME=/opt/netscape
# Private X libraries rebuilt to tolerate the 4-byte stack alignment of 2001 code.
export LD_LIBRARY_PATH="$MOZILLA_HOME/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
# setjmp/longjmp without pointer mangling, required by NSPR user-level threads.
# glibc expands $LIB to lib32 for Netscape and to lib for any 64-bit child.
export LD_PRELOAD="$MOZILLA_HOME/preload/"'$LIB'"/libns4jmp.so${LD_PRELOAD:+ $LD_PRELOAD}"
export XKEYSYMDB="$MOZILLA_HOME/XKeysymDB"
export XFILESEARCHPATH="$MOZILLA_HOME/%N.ad${XFILESEARCHPATH:+:$XFILESEARCHPATH}"
export CLASSPATH="$MOZILLA_HOME/java/classes"

# Netscape 4 predates UTF-8 locales and misbehaves (or crashes) under them.
export LC_ALL=C
unset LANG

# First run: seed the profile with the default bookmarks, like ns-install did,
# and a home page that still works over plain HTTP.
if [ ! -d "$HOME/.netscape" ]; then
	mkdir -p "$HOME/.netscape"
	cp "$MOZILLA_HOME/bookmark.htm" "$HOME/.netscape/bookmarks.html"
	chmod 644 "$HOME/.netscape/bookmarks.html"
	printf '%s\n' '// Netscape User Preferences' \
		'user_pref("browser.startup.homepage", "http://68k.news/");' \
		> "$HOME/.netscape/preferences.js"
fi

exec "$MOZILLA_HOME/netscape" "$@"
