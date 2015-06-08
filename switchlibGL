#!/bin/sh
#
# Vi0L0: i modified it a bit and added lib32 switch, version 2.1
#
# Copyright (c) 2010-2011 Sebastian Siebert (freespacer@gmx.de)
# All rights reserved.
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.

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


function switch_to_amd() {

    ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so
    ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so.1
    ln -snf /usr/lib/fglrx/fglrx-libGL.so.1.2 /usr/lib/libGL.so.1.2.0
    ldconfig /usr/lib

  #lib32 switch
    if [ -e /usr/lib32/fglrx/fglrx-libGL.so.1.2 ]; then
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so.1
      ln -snf /usr/lib32/fglrx/fglrx-libGL.so.1.2 /usr/lib32/libGL.so.1.2.0
      ldconfig /usr/lib32
    fi

}

function switch_to_intel() {

    ln -snf /usr/lib/mesa/libGL.so.1.2.0 /usr/lib/libGL.so
    ln -snf /usr/lib/mesa/libGL.so.1.2.0 /usr/lib/libGL.so.1
    ln -snf /usr/lib/mesa/libGL.so.1.2.0 /usr/lib/libGL.so.1.2.0
    ldconfig /usr/lib

  #lib32 switch
    if [ -e /usr/lib32/mesa/libGL.so.1.2.0 ]; then
      ln -snf /usr/lib32/mesa/libGL.so.1.2.0 /usr/lib32/libGL.so
      ln -snf /usr/lib32/mesa/libGL.so.1.2.0 /usr/lib32/libGL.so.1
      ln -snf /usr/lib32/mesa/libGL.so.1.2.0 /usr/lib32/libGL.so.1.2.0
      ldconfig /usr/lib32
    fi

}

function get_current_driver() {

    LIB_LINK="`readlink /usr/lib/libGL.so 2>/dev/null`"
    if [[ "${LIB_LINK}" = "/usr/lib/fglrx/fglrx-libGL.so.1.2" || "${LIB_LINK}" = "fglrx/fglrx-libGL.so.1.2" ]]; then
        echo "amd"
    elif [[ "${LIB_LINK}" = "/usr/lib/mesa/libGL.so.1.2.0" ||  "${LIB_LINK}" = "/usr/lib/mesa/libGL.so.1" || "${LIB_LINK}" = "/usr/lib/mesa/libGL.so" ]]; then
        echo "intel"
    else
        echo "unknown"
    fi

}

case "$1" in
    amd)
        echo "Switch to AMD" 1>&2
        switch_to_amd
    ;;
    intel)
        echo "Switch to Intel" 1>&2
        switch_to_intel
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
