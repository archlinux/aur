#!/bin/sh

# Vi0L0: it's my switching script:
# * switching xorg.conf - it will rename xorg.conf into xorg.conf.cat
#   (if there's fglrx inside) or xorg.conf.oth (if there's intel or radeon inside).
#   And then it will create link to xorg.conf depending on what did you choose
# * running aticonfig --px-Xgpu
# * running switchlibGL
# * adding/removing fglrx into/from /etc/modules-load.d/catalyst.conf
#
# You can do with it whatever you want :P
# NO WARRANTY OF ANY KIND

# Set local language always to C
export LC_ALL=C
export LANG=C

if [ "$(whoami)" != "root" ]; then
    echo "Must be root to run this script." 1>&2
    exit 1
fi

if [ $# -ge 2 ]; then
    echo "Usage: $(basename $0) <amd|intel|query>" 1>&2
    echo "Please choose one parameter" 1>&2
    exit 1
fi



function check_xorg_conf() {

    if [ ! -e /etc/X11/xorg.conf.cat ];then
      if [ -e /etc/X11/xorg.conf ] && [[ `cat /etc/X11/xorg.conf | grep -c fglrx` != 0 ]]; then
      mv /etc/X11/xorg.conf /etc/X11/xorg.conf.cat
      echo "/etc/X11/xorg.conf renamed to /etc/X11/xorg.conf.cat"
      fi
    fi
    if [ ! -e /etc/X11/xorg.conf.oth ]; then
      if [ -e /etc/X11/xorg.conf ];then
	if [[ `cat /etc/X11/xorg.conf | grep -c radeon` != 0 ]] || [[ `cat /etc/X11/xorg.conf | grep -c intel` != 0 ]]; then
	  mv /etc/X11/xorg.conf /etc/X11/xorg.conf.oth
	  echo "/etc/X11/xorg.conf renamed to /etc/X11/xorg.conf.oth (radeon or intel inside)"
	fi
      fi
    fi
    if [ -e /etc/X11/xorg.conf ] && [[ `cat /etc/X11/xorg.conf | grep -c fglrx` = 0 ]] && [[ `cat /etc/X11/xorg.conf | grep -c radeon` = 0 ]] && [[ `cat /etc/X11/xorg.conf | grep -c intel` = 0 ]]; then
      mv /etc/X11/xorg.conf /etc/X11/xorg.conf.wth
      echo "/etc/X11/xorg.conf have no fglrx or radeon or intel inside!"
      echo "/etc/X11/xorg.conf renamed to /etc/X11/xorg.conf.wth"
    fi
}

function switch_to_amd() {

   #switching xorg.conf
    echo -e '\E[37;44m'"\033[1mSwitching xorg.conf ...\033[0m"
    check_xorg_conf
    if [ -e /etc/X11/xorg.conf.cat ]; then
      ln -snf /etc/X11/xorg.conf.cat /etc/X11/xorg.conf
      echo "/etc/X11/xorg.conf.cat linked to /etc/X11/xorg.conf"
    fi

   #linking!
    echo -e '\E[37;44m'"\033[1mRunning aticonfig --px-dgpu ...\033[0m"
    aticonfig --px-dgpu
    echo -e '\E[37;44m'"\033[1mRunning /usr/lib/fglrx/switchlibGL amd ...\033[0m"
    /usr/lib/fglrx/switchlibGL amd
    echo -e '\E[37;44m'"\033[1mRunning /usr/lib/fglrx/switchlibglx amd ...\033[0m"
    /usr/lib/fglrx/switchlibglx amd

   #checking MODULES for fglrx
    echo -e '\E[37;44m'"\033[1mChecking /etc/modules-load.d/catalyst.conf for fglrx ...\033[0m"
    check1=$(grep fglrx /etc/modules-load.d/catalyst.conf)
    if [ "$check1" != "fglrx" ]; then
      echo fglrx > /etc/modules-load.d/catalyst.conf
      echo "fglrx was added into /etc/modules-load.d/catalyst.conf"
    fi

}

function switch_to_intel() {

   #switching xorg.conf part 1
    echo -e '\E[37;44m'"\033[1mSwitching xorg.conf (part 1) ...\033[0m"
    check_xorg_conf
    if [ -e /etc/X11/xorg.conf.cat ]; then
      ln -snf /etc/X11/xorg.conf.cat /etc/X11/xorg.conf
      echo "/etc/X11/xorg.conf.cat linked to /etc/X11/xorg.conf"
    fi

   #linking!
    echo -e '\E[37;44m'"\033[1mRunning aticonfig --px-igpu ...\033[0m"
    aticonfig --px-igpu
    echo -e '\E[37;44m'"\033[1mRunning /usr/lib/fglrx/switchlibGL intel ...\033[0m"
    /usr/lib/fglrx/switchlibGL intel
    echo -e '\E[37;44m'"\033[1mRunning /usr/lib/fglrx/switchlibglx intel ...\033[0m"
    /usr/lib/fglrx/switchlibglx intel

   #switching xorg.conf part 2
    echo -e '\E[37;44m'"\033[1mSwitching xorg.conf (part 2) ...\033[0m"
    if [ -e /etc/X11/xorg.conf.oth ]; then
      ln -snf /etc/X11/xorg.conf.oth /etc/X11/xorg.conf
      echo "/etc/X11/xorg.conf.oth linked to /etc/X11/xorg.conf"
      else
	rm /etc/X11/xorg.conf
	echo "/etc/X11/xorg.conf was removed"
    fi

   #checking MODULES for fglrx
    echo -e '\E[37;44m'"\033[1mChecking  /etc/modules-load.d/catalyst.conf for fglrx ...\033[0m"
    check=$(grep fglrx /etc/modules-load.d/catalyst.conf)
    if [[ "$check" != "" ]]; then
      sed 's/fglrx//' -i /etc/modules-load.d/catalyst.conf
      echo "fglrx was removed from /etc/modules-load.d/catalyst.conf"
    fi

}

function get_current_driver() {

    LIB_LINK="`readlink /usr/lib/catalystpxp/libGL.so.1.2 2>/dev/null`"
    if [ "${LIB_LINK}" = "/usr/lib/catalystpxp/fglrx/fglrx-libGL.so.1.2" ]; then
        echo "amd (catalyst)"
    elif [ "${LIB_LINK}" = "fglrx/fglrx-libGL.so.1.2" ]; then
        echo "catalyst"
    elif [[ "${LIB_LINK}" = "/usr/lib/libGL.so.1.2" ||  "${LIB_LINK}" = "/usr/lib/libGL.so.1.2.0" || "${LIB_LINK}" = "/usr/lib/libGL.so" ]]; then
        echo "intel (or radeon)"
    else
        echo "unknown"
    fi

}


case "$1" in
    amd)
        switch_to_amd
	echo -e '\E[37;44m'"\033[1mSwitched to Catalyst\033[0m" 1>&2
    ;;
    intel)
        switch_to_intel
	echo -e '\E[37;44m'"\033[1mSwitched to Intel (or Radeon)\033[0m" 1>&2
    ;;
    query)
        get_current_driver
    ;;
    *)
        echo "Usage: $(basename $0) <amd|intel|query>" 1>&2
        exit 1
    ;;
esac

exit 0
