#!/bin/bash

kernver=${KERNVER:-$(uname -r)}
arch=${ARCH:-$(uname -m)}
arch=${arch/i686/i386}
LOG="/var/log/catalyst-install.log"


install_module(){
    echo ""
    echo "--------"
    date '+%Y-%m-%d %H:%M:%S'
    echo "Building fglrx module for ${kernver} kernel ..."
    echo "--------"


    if [ ! -d "/usr/lib/modules/${kernver}/build" ]; then
      echo "Kernel header files are absent: directory /usr/lib/modules/${kernver}/build doesn't exist! Game over"
      return 1
    fi
    workdir=$(mktemp -du /tmp/catalyst.XXXXXX)
#    set -x
    cp "/usr/share/ati/build_mod" "${workdir}" -R
    cd "$workdir"

  ## include ati_make.sh and use _ati_check function from it
    . ati_make.sh
    _ati_check

#------------------------------------------------------------------------------------------
# putting our info into module
    modsymmd5=`md5sum /usr/lib/modules/${kernver}/build/Module.symvers  | cut -d ' ' -f 1`
    sed "/MODULE_DESCRIPTION/a\MODULE_DESCRIPTION(\"__msm:$modsymmd5\");" -i firegl_public.c
#------------------------------------------------------------------------------------------

  ## Compile module using _ati_check variables
    CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions"
    make -C /usr/lib/modules/${kernver}/build SUBDIRS="`pwd`" ARCH=${arch} \
      MODFLAGS="$CFLAGS_MODULE" \
      CFLAGS_MODULE="$CFLAGS_MODULE" \
      PAGE_ATTR_FIX=$PAGE_ATTR_FIX COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE modules || return 1

    gzip -9 fglrx.ko

  ## here we are checking kernel's extramodules dir
    for r in /usr/lib/modules/*; do
      if [[ ${r:17:3} = "ext" ]]; then
	if [[ `cat ${r}/version | grep -c ${kernver}` != 0 ]]; then
	  destidir=${r}
	fi
      fi
    done

    install -m644 fglrx.ko.gz ${destidir} || return 1

    depmod ${kernver}
    rm -rf "${workdir}"
#    set +x
    echo "Ok."
}

build_all_modules(){
     for p in /usr/lib/modules/*; do
      if [ ${p:17:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
	/usr/bin/catalyst_build_module ${p##*/usr/lib/modules/}
      fi
     done
}

remove_module(){
    for p in /usr/lib/modules/*; do
      if [[ ${p:17:3} != "ext" ]]; then
	if [ ! -d $p/kernel ]; then
	  if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]] || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/video/fglrx.ko.gz" &>/dev/null
	    rm "$p/video/fglrx.ko" &>/dev/null
	    rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	    rm "$p/extramodules/fglrx.ko" &>/dev/null
	    rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	  fi
	  if [ -d $p ]; then
	    if [ -z "$(ls $p)" ]; then
	      echo "+ removing empty directory: $p"
	      rm -rf $p
		else echo "- $p looks like unused, maybe remove it manualy?"
	    fi
	  fi
	fi
      elif [[ ! -e $p/version ]]; then
	if [[ -e $p/fglrx.ko.gz ]] || [[ -e $p/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/fglrx.ko.gz" &>/dev/null
	    rm "$p/fglrx.ko" &>/dev/null
	fi
	if [ -z "$(ls $p)" ]; then   #check if /usr/lib/modules/ext* is empty
	    echo "+ removing empty directory: $p"
	    rm -rf $p
	    else  echo "- $p looks like unused, maybe remove it manualy?"
	fi
      fi
    done
}

remove_all_modules(){
   for p in /usr/lib/modules/*; do
    if [[ ${p:17:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]]  || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	echo "+ removing fglrx module from $p"
	rm "$p/video/fglrx.ko.gz" &>/dev/null
	rm "$p/video/fglrx.ko" &>/dev/null
	rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	rm "$p/extramodules/fglrx.ko" &>/dev/null
	rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	depmod $(basename $p)
     fi
     if [ -d $p ]; then
      if [ -z "$(ls $p)" ]; then   #check if /usr/lib/modules/p is empty
	echo "+ removing empty directory: $p"
	rm -rf $p
	elif [ ! -d $p/kernel ]; then
	  echo "- $p looks like unused, maybe remove it manualy?"
      fi
     fi
    elif [[ ! -e $p/version ]]; then
      if [[ -e $p/fglrx.ko.gz ]] || [[ -e $p/fglrx.ko ]]; then
	  echo "+ removing fglrx module from $p"
	  rm "$p/fglrx.ko.gz" &>/dev/null
	  rm "$p/fglrx.ko" &>/dev/null
      fi
      if [ -z "$(ls $p)" ]; then   #check if /usr/lib/modules/ext* is empty
	  echo "+ removing empty directory: $p"
	  rm -rf $p
	  else  echo "- $p looks like unused, maybe remove it manualy?"
      fi
    fi
   done
}

remove_old_modules(){
   for p in /lib/modules/*; do
    if [[ ${p:13:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
      echo "+ removing old fglrx module from $p"
      rm "$p/video/fglrx.ko" &>/dev/null
      rm "$p/extramodules/fglrx.ko" &>/dev/null
      rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
      depmod $(basename $p)
     fi
    fi
   done
}

hook_add(){
    # add hook fglrx to mkiniticpio
    hooks=$(grep ^HOOKS /etc/mkinitcpio.conf | grep fglrx)
    if [ "$hooks" = "" ]; then
        # add hook fglrx
        sed 's/^HOOKS="\([^"]*\)"/HOOKS="\1 fglrx"/' -i /etc/mkinitcpio.conf
	echo "fgkrx hook was added into /etc/mkinitcpio.conf"
    fi
}

hook_remove(){
    # remove hook fglrx
    sed '/^HOOKS/s/ *fglrx//' -i /etc/mkinitcpio.conf
    echo "fgkrx hook was removed from /etc/mkinitcpio.conf"
}

check_modules(){
    for p in /usr/lib/modules/*; do
	if [ ${p:17:3} != "ext" ] && [ -d $p/build ] && [ -d $p/kernel ]; then
		if [[ -e $p/extramodules/fglrx.ko.gz ]]; then
		      compare=$(md5sum $p/build/Module.symvers  | cut -d ' ' -f 1)
		      test=$(modinfo -F description $p/extramodules/fglrx.ko.gz | grep "__msm:")
		      if [ "$test" != "__msm:$compare" ]; then
			    /usr/bin/catalyst_build_module ${p##*/usr/lib/modules/}
		      fi
		else /usr/bin/catalyst_build_module ${p##*/usr/lib/modules/}
		fi
	fi
    done
}

case "$1" in
    help|--help)
        echo "usage: $0 {version|all|remove|remove_all|ra|hookadd|hookrm}"
        echo "- with no specified kernel version it will use the current kernel version to build module"
	echo "- all will try to build fglrx modules for all working system's kernels"
        echo "- remove is removing unused fglrx modules and all empty /usr/lib/modules/* directories"
        echo "- remove_all is removing all fglrx modules and all empty /usr/lib/modules/* directories"
        echo "- ra works same as remove_all"
        echo "- hookadd will add fglrx hook into mkinitcpio"
        echo "- hookrm will remove fglrx hook from mkinitcpio"
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
    remove_old)
        remove_old_modules
        ;;
    hookadd)
	hook_add
	;;
    hookrm)
	hook_remove
	;;
    all)
	build_all_modules
	;;
    check)
	check_modules
	;;
    *)
        test "$1" != "" && kernver="$1"
	echo "Building fglrx module for ${kernver} kernel ..."
        install_module >> $LOG 2>&1 && echo "Ok." || echo -e '\E[37;44m'"\033[1mFailed!!! Check out log: $LOG\033[0m"
        ;;
esac