#!/bin/sh -e
#check for all dependencies
for prog in mono readlink df 7za;do
    [ -n "`whereis -b ${prog} | cut -sd' ' -f2`" ] || (echo "Please install ${prog}" && exit 1);
done
for lib in libsqlite3;do
    [ -n "`ldconfig -p | grep ${lib}`" ] || (echo "Please install ${lib}" && exit 1);
done
dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
echo "Located in ${dir}";
gbmpath='./';
#locate GBM.exe
if [ "${dir}" = '/usr/bin' ] && [ -s '/usr/share/gbm/GBM.exe' ]; then
    gbmpath='/usr/share/gbm/';
elif [ "${dir}" = '/usr/local/bin' ] && [ -s '/usr/local/share/gbm/GBM.exe' ]; then
    gbmpath='/usr/local/share/gbm/';
elif [ ! -s './GBM.exe' ]; then
    echo 'GBM.exe not found';
    exit 2;
fi
mono --desktop ${gbmpath}'GBM.exe' "$@";
exit $?;
