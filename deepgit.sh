#!/bin/bash

# TODO
# this seems necessary for Solaris to find the Cairo-library
# export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib/gnome-private/lib

if type "lsb_release" > /dev/null 2> /dev/null ; then
    if [ "$XDG_CURRENT_DESKTOP" == "Unity" ] ; then
        # work-around for https://bugs.eclipse.org/bugs/show_bug.cgi?id=419729
        # work-around for https://bugs.eclipse.org/bugs/show_bug.cgi?id=502056
        export UBUNTU_MENUPROXY=0

        # Without the following line sliders are not visible in Ubuntu 12.04
        # (see <https://bugs.eclipse.org/bugs/show_bug.cgi?id=368929>)
        export LIBOVERLAY_SCROLLBAR=0
    fi
fi

if [ "$KDE_SESSION_UID" != "" ] && [ "$GTK2_RC_FILES" == "" ] ; then
	if grep -q "oxygen-gtk" "$HOME/.gtkrc-2.0-kde4"; then
		echo "Please change the GTK+ theme to something else than oxygen-gtk."
		echo "See also http://www.syntevo.com/blog/?p=4143"
		exit -1
	fi
fi

# as workaround for https://bugs.eclipse.org/bugs/show_bug.cgi?id=435773
export SWT_GTK3=0

_GC_OPTS="-XX:+UseG1GC -XX:MaxGCPauseMillis=100 -XX:InitiatingHeapOccupancyPercent=25 -Xmx768m"
_MISC_OPTS="-Xverify:none -XX:MaxJavaStackTraceDepth=1000000 -Dsun.io.useCanonCaches=false"


exec /usr/bin/java $_GC_OPTS $_MISC_OPTS -jar '/usr/share/java/deepgit/lib/bootloader.jar' "$@"
