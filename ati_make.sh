#!/bin/bash
### Vi0L0: it is ati's code from their make.sh file, modified a bit to fit our arch linux system, used inside PKGBUILD

# Copyright 1999-2005 ATI Technologies Inc., Markham, Ontario, CANADA.
# All Rights Reserved.
#
# Your use and or redistribution of this software in source and \ or
# binary form, with or without modification, is subject to: (i) your
# ongoing acceptance of and compliance with the terms and conditions of
# the ATI Technologies Inc. software End User License Agreement; and (ii)
# your inclusion of this notice in any version of this software that you
# use or redistribute.  A copy of the ATI Technologies Inc. software End
# User License Agreement is included with this software and is also
# available by contacting ATI Technologies Inc. at http://www.ati.com


function _ati_check()
{
# ==============================================================
# resolve if we are running a SMP enabled kernel

SMP=0

# 1
# grep in OsVersion string for SMP specific keywords
OsVersion=`uname -v`

if [ `echo $OsVersion | grep [sS][mM][pP] -c` -ne 0 ]; then
  SMP=1
  echo "OsVersion says: SMP=$SMP"
fi

# 2
# grep in /proc/ksyms for SMP specific kernel symbols
# use triggerlevel of 10 occurences
# (UP kernels might have 0-1, SMP kernels might have 32-45 or much more)

src_file=/proc/kallsyms

if [ -e $src_file ]; then
  if [ `fgrep smp $src_file -c` -gt 10 ]; then
    SMP=1
    echo "file $src_file says: SMP=$SMP"
  fi
fi

# 3
# linux/autoconf.h may contain this: #define CONFIG_SMP 1

# Before 2.6.33 autoconf.h is under linux/.
# For 2.6.33 and later autoconf.h is under generated/.
if [ -f /usr/lib/modules/${_kernver}/build/include/generated/autoconf.h ]; then
    autoconf_h=/usr/lib/modules/${_kernver}/build/include/generated/autoconf.h
else
    autoconf_h=/usr/lib/modules/${_kernver}/build/include/linux/autoconf.h
fi
src_file=$autoconf_h

if [ ! -e $src_file ]; then
  echo "Warning:"
  echo "kernel includes at /usr/lib/modules/${_kernver}/build/include not found or incomplete"
  echo "file: $src_file"
  echo ""
else
  if [ `cat $src_file | grep "#undef" | grep "CONFIG_SMP" -c` = 0 ]; then
    SMP=`cat $src_file | grep CONFIG_SMP | cut -d' ' -f3`
    echo "file $src_file says: SMP=$SMP"
  fi
fi

if [ "$SMP" = 0 ]; then
  echo "assuming default: SMP=$SMP"
fi

# act on final result
if [ ! "$SMP" = 0 ]; then
  smp="-SMP"
  def_smp=-D__SMP__
fi
# ==============================================================
# resolve whether we need to set PAGE_ATTR_FIX
PAGE_ATTR_FIX=0

src_file=/proc/kallsyms

if [ -e $src_file ]; then
  if [ `fgrep " change_page_attr\$" $src_file -c` -gt 0 ]; then
    PAGE_ATTR_FIX=1
    echo "file $src_file says: PAGE_ATTR_FIX=$PAGE_ATTR_FIX"
  fi
fi
# ==============================================================
# resolve if we are running a MODVERSIONS enabled kernel

MODVERSIONS=0

# autoconf.h may contain this: #define CONFIG_MODVERSIONS 1
src_file=$autoconf_h
if [ ! -e $src_file ];
then
  echo "Warning:"
  echo "kernel includes at /usr/lib/modules/${_kernver}/build/include not found or incomplete"
  echo "file: $src_file"
  echo ""
else
  if [ `cat $src_file | grep "#undef" | grep "CONFIG_MODVERSIONS" -c` = 0 ]
  then
    MODVERSIONS=`cat $src_file | grep CONFIG_MODVERSIONS | cut -d' ' -f3`
    echo "file $src_file says: MODVERSIONS=$MODVERSIONS"
  fi
fi

if [ "$MODVERSIONS" = 0 ]
then
  echo "assuming default: MODVERSIONS=$MODVERSIONS"
fi

# act on final result
if [ ! "$MODVERSIONS" = 0 ]
then
  def_modversions="-DMODVERSIONS"
fi

# ==============================================================
# resolve if we are building for a kernel with a fix for CVE-2010-3081
# On kernels with the fix, use arch_compat_alloc_user_space instead
# of compat_alloc_user_space since the latter is GPL-only

COMPAT_ALLOC_USER_SPACE=compat_alloc_user_space

src_file=/usr/lib/modules/${_kernver}/build/arch/x86/include/asm/compat.h
if [ ! -e $src_file ];
then
  echo "Warning:"
  echo "kernel includes at /usr/lib/modules/${_kernver}/build/include not found or incomplete"
  echo "file: $src_file"
  echo ""
else
  if [ `cat $src_file | grep -c arch_compat_alloc_user_space` -gt 0 ]
  then
    COMPAT_ALLOC_USER_SPACE=arch_compat_alloc_user_space
  fi
  echo "file $src_file says: COMPAT_ALLOC_USER_SPACE=$COMPAT_ALLOC_USER_SPACE"
fi
}