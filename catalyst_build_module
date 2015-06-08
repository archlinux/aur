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

    if [ -d "/usr/lib/modules/${kernver}" ]; then
	    where_modules="/usr/lib/modules"
	    elif [ -d "/lib/modules/${kernver}" ]; then
		    where_modules="/lib/modules"
    fi

    if [ ! -d "${where_modules}/${kernver}/build" ]; then
      echo "Kernel header files are absent: directory ${where_modules}/${kernver}/build doesn't exist! Game over"
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
    sed "/MODULE_DESCRIPTION/a\MODULE_DESCRIPTION(\"__unv:$(uname -v)\");" -i firegl_public.c
#------------------------------------------------------------------------------------------

   ## Compile module using _ati_check variables
    CFLAGS_MODULE="-DMODULE -DATI -DFGL -DPAGE_ATTR_FIX=$PAGE_ATTR_FIX -DCOMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE $def_smp $def_modversions"
    make -C ${where_modules}/${kernver}/build SUBDIRS="`pwd`" ARCH=${arch} \
      MODFLAGS="$CFLAGS_MODULE" \
      CFLAGS_MODULE="$CFLAGS_MODULE" \
      PAGE_ATTR_FIX=$PAGE_ATTR_FIX COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE modules || return 1

    gzip -9 fglrx.ko

  ## here we are checking kernel's extramodules dir
    for r in ${where_modules}/*; do
      if [ $where_modules = "/usr/lib/modules" ]; then
	s=${r:17}
      elif [ $where_modules = "/lib/modules" ]; then
	s=${r:13}
      fi
      if [[ ${s:0:3} = "ext" ]]; then
	if [[ `cat ${r}/version | grep -c ${kernver}` != 0 ]]; then
	  destidir=${s}
	fi
	elif [[ ${s} = ${kernver} ]] && [[ ! -e ${r}/extramodules ]]; then
	  destidir=${kernver}/video
      fi
    done

    install -m755 -d "${where_modules}/${destidir}/" || return 1
    install -m644 fglrx.ko.gz "${where_modules}/${destidir}/" || return 1


    depmod ${kernver}
    rm -rf "${workdir}"
#    set +x
    echo "Ok. Module built succesfully."
}

remove_module(){
if [ -d "/usr/lib/modules" ]; then
    for p in /usr/lib/modules/*; do
      if [[ ${p:17:3} != "ext" ]]; then
	if [ ! -d $p/kernel ]; then  #check if /usr/lib/modules/p/kernel directory does NOT exist
	  if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]] || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/video/fglrx.ko.gz" &>/dev/null
	    rm "$p/video/fglrx.ko" &>/dev/null
	    rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	    rm "$p/extramodules/fglrx.ko" &>/dev/null
	    rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	  fi
	  if [ -d $p ]; then   #check if ${where_modules}/p exist
	    if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	      echo "+ removing empty directory: $p"
	      rm -rf $p
		else echo "- $p looks like unused, maybe remove it manualy?"
	    fi
	  fi
	fi
      fi
    done
fi

if [ -d "/lib/modules" ]; then
    for p in /lib/modules/*; do
      if [[ ${p:13:3} != "ext" ]]; then
	if [ ! -d $p/kernel ]; then  #check if /lib/modules/p/kernel directory does NOT exist
	  if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]] || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
	    echo "+ removing fglrx module from $p"
	    rm "$p/video/fglrx.ko.gz" &>/dev/null
	    rm "$p/video/fglrx.ko" &>/dev/null
	    rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
	    rm "$p/extramodules/fglrx.ko" &>/dev/null
	    rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
	  fi
	  if [ -d $p ]; then   #check if ${where_modules}/p exist
	    if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	      echo "+ removing empty directory: $p"
	      rm -rf $p
		else echo "- $p looks like unused, maybe remove it manualy?"
	    fi
	  fi
	fi
      fi
    done
fi
}

remove_all_modules(){
if [ -d "/usr/lib/modules" ]; then
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
     if [ -d $p ]; then   #check if /usr/lib/modules/p exist
      if [ -z "$(ls $p)" ]; then   #check if /usr/lib/modules/p is empty
	echo "+ removing empty directory: $p"
	rm -rf $p
	elif [ ! -d $p/kernel ]; then
	  echo "- $p looks like unused, maybe remove it manualy?"
      fi
     fi
    fi
   done
fi

if [ -d "/lib/modules" ]; then
   for p in /lib/modules/*; do
    if [[ ${p:13:3} != "ext" ]]; then
     if [[ -e $p/video/fglrx.ko.gz ]] || [[ -e $p/extramodules/fglrx.ko.gz ]]  || [[ -e $p/video/fglrx.ko ]] || [[ -e $p/extramodules/fglrx.ko ]]; then
      echo "+ removing fglrx module from $p"
      rm "$p/video/fglrx.ko.gz" &>/dev/null
      rm "$p/video/fglrx.ko" &>/dev/null
      rm "$p/extramodules/fglrx.ko.gz" &>/dev/null
      rm "$p/extramodules/fglrx.ko" &>/dev/null
      rmdir -p "$p/video/" --ignore-fail-on-non-empty &>/dev/null
      depmod $(basename $p)
     fi
     if [ -d $p ]; then   #check if ${where_modules}/p exist
      if [ -z "$(ls $p)" ]; then   #check if ${where_modules}/p is empty
	echo "+ removing empty directory: $p"
	rm -rf $p
	elif [ ! -d $p/kernel ]; then
	  echo "- $p looks like unused, maybe remove it manualy?"
      fi
     fi
    fi
   done
fi
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

auto_recompile(){
    # add autofglrx daemon to rc.conf
    angel=$(grep ^DAEMONS /etc/rc.conf | grep autofglrx)
    if [ "$angel" = "" ]; then
      sed 's/DAEMONS=(/DAEMONS=(autofglrx /' -i /etc/rc.conf
    fi
    echo "Auto re-compilation is Enabled."
}

auto_recompile_off(){
    # remove autofglrx
    sed '/^DAEMONS/s/ *autofglrx //' -i /etc/rc.conf
    echo "Auto re-compilation is Disabled."
}

case "$1" in
    help|--help)
        echo "usage: $0 {remove|remove_all|auto|autooff}"
        echo "- remove is removing unused fglrx modules and all empty /lib/modules/* directories"
        echo "- remove_all is removing all fglrx modules and all empty /lib/modules/* directories"
        echo "- auto will turn ON 'auto re-compilation of fglrx module when system is starting'"
        echo "- autooff will turn off auto re-compilation of fglrx module"
        ;;
    remove)
        remove_module
        ;;
    remove_all)
        remove_all_modules
        ;;
    remove_old)
        remove_old_modules
        ;;
    auto)
	auto_recompile
	;;
    autooff)
	auto_recompile_off
	;;
    *)
	echo "Building fglrx module for ${kernver} kernel ..."
        install_module >> $LOG 2>&1 && echo "Ok." || echo "Failed!!! Check out log: $LOG"
        ;;
esac

