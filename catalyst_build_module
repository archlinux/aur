#!/bin/bash

kernver=${KERNVER:-$(uname -r)}
arch=${ARCH:-$(uname -m)}
arch=${arch/i686/i386}
catver=whatever


install_module(){
  # here we are checking kernel's extramodules dir
    for r in /usr/lib/modules/*; do
      s=${r##*/usr/lib/modules/}
      if [[ ${s:0:3} = "ext" ]]; then
	if [[ `cat ${r}/version | grep -c ${kernver}` != 0 ]]; then
	 pakaver="${s#*-}"
	 destdir="${s}"
	fi
      fi
    done

    echo ""
    echo -e '\E[37;44m'"\033[1mBuilding catalyst-${pakaver} package for ${kernver} kernel ...\033[0m"
    echo "--------"
    if [ ! -d "/usr/lib/modules/${kernver}/build" ]; then
      echo -e '\E[37;44m'"\033[1mKernel header files are absent: directory /usr/lib/modules/${kernver}/build doesn't exist! Game over\033[0m"
      echo "--------"
      return 1
    fi
    workdir=$(mktemp -du /tmp/catalyst.XXXXXX)
#    set -x
    cp "/usr/share/ati/build_mod" "${workdir}" -R
    cd "$workdir"
    sed -i -e "s/_kernver=.*/_kernver=${kernver}/" PKGBUILD
    sed -i -e "s/_pakaver=.*/_pakaver=${pakaver}/" PKGBUILD
    sed -i -e "s/_destdir=.*/_destdir=${destdir}/" PKGBUILD
    if [ "${LOGNAME}" = "root" ]; then
      if [ "${user}" = "root" ]; then
       /usr/bin/makepkg -c --asroot || return 1
     	 else
    	   chown ${user}:video ${workdir}
    	   chown ${user}:video ${workdir}/* >> /dev/null 2>&1
    	   su - ${user} -c "cd ${workdir} && /usr/bin/makepkg -c" || return 1
      fi
      else
	 /usr/bin/makepkg -c || return 1
    fi

    echo -e '\E[37;44m'"\033[1mOk. catalyst-${pakaver} package built succesfully. Installing ...\033[0m"
    if [ -e /usr/bin/sudo ]; then
        echo -e '\E[37;44m'"\033[1mIf it's asking for password - type YOUR password\033[0m"
        sudo /usr/bin/pacman -Ud ${workdir}/catalyst-${pakaver}-${catver}-$(uname -m).pkg.tar || return 1
    else
        echo -e '\E[37;44m'"\033[1mIf it's asking for password - type root password\033[0m"
        su - root -c "/usr/bin/pacman -Ud ${workdir}/catalyst-${pakaver}-${catver}-$(uname -m).pkg.tar" || return 1
    fi
    rm -rf "${workdir}"
#    set +x
    echo -e '\E[37;44m'"\033[1mDone.\033[0m"
}


build_all_modules(){
    for p in /usr/lib/modules/*; do
      if [ ${p:17:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
	/usr/bin/catalyst_build_module ${p##*/usr/lib/modules/}
      fi
    done
}


remove_module(){
    echo "Removing unused catalyst-{kernver} packages ..."
      for p in /usr/lib/modules/*; do
	# first check is used for historical reasons and should be removed soon - Vi0L0 on 16.03.2013
	if [[ ${p:17:3} != "ext" ]] && [[ ! -d $p/kernel ]] && [[ -e $p/video/fglrx.ko.gz ]]; then
		/usr/bin/pacman -Rd --noconfirm catalyst-${p##*/lib/modules/}
	elif [[ ${p:17:3} = "ext" ]] && [[ ! -e $p/version ]] && [[ -e $p/fglrx.ko.gz ]]; then
		/usr/bin/pacman -Rd --noconfirm catalyst-${p##*/lib/modules/extramodules-}
	fi
      done
}


remove_all_modules(){
    echo "Removing all catalyst-{kernver} packages ..."
      for p in /usr/lib/modules/*; do
	    if [[ ${p:17:3} != "ext" ]] && [[ -e $p/video/fglrx.ko.gz ]]; then
		    /usr/bin/pacman -Rd --noconfirm catalyst-${p##*/usr/lib/modules/}
	    elif [[ ${p:17:3} = "ext" ]] && [[ -e $p/fglrx.ko.gz ]]; then
		    /usr/bin/pacman -Rd --noconfirm catalyst-${p##*/usr/lib/modules/extramodules-}
	    fi
      done
}


case "$1" in
    help|--help)
        echo "usage: $0 {version|all|remove|remove_all|ra}"
        echo "- with no specified kernel version it will use the current kernel version to build module"
	echo "- all will try to build fglrx modules for all working system's kernels"
        echo "- remove is removing unused catalyst-{kernver} packages"
        echo "- remove_all is removing all catalyst-{kernver} packages"
        echo "- ra works same as remove_all"
        ;;
    all)
	build_all_modules
	;;
    remove)
        remove_module
        ;;
    remove_all)
        remove_all_modules
        ;;
    ra)
        remove_all_modules
        ;;
    *)
        test "$1" != "" && kernver="$1"
	if [ "$2" != "" ]; then user="$2"
          elif [ "${LOGNAME}" = "root" ]; then
	      echo "Please specify your (unprivileged) user name:"
	      read user
	fi
        install_module
        ;;
esac

