#!/bin/sh
extract_rpm ()
{
	RPM=$1
	leadsize=96
	o=`expr $leadsize + 8`
	set `od -j $o -N 8 -t u1 $pkg`
	il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
	dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`

	sigsize=`expr 8 + 16 \* $il + $dl`
	o=`expr $o + $sigsize + \( 8 - \( $sigsize \% 8 \) \) \% 8 + 8`
	set `od -j $o -N 8 -t u1 $pkg`
	il=`expr 256 \* \( 256 \* \( 256 \* $2 + $3 \) + $4 \) + $5`
	dl=`expr 256 \* \( 256 \* \( 256 \* $6 + $7 \) + $8 \) + $9`
	hdrsize=`expr 8 + 16 \* $il + $dl`
	o=`expr $o + $hdrsize`
	dd if=$pkg ibs=$o skip=1 2>/dev/null | bsdtar -xf -
}
extract_deb ()
{
	DEB=$1
	bsdtar -xf ${DEB} data.tar.gz
	bsdtar -xf data.tar.gz
	rm data.tar.gz
}
pkg=$1
if [ "$pkg" = "" -o ! -e "$pkg" ]; then
	echo "no package supplied" 1>&2
	exit 1
fi
ext=`echo $pkg | awk -F. '{ print $NF }'`
case "$ext" in
	rpm|RPM)
		extract_rpm $pkg
		;;
	deb|DEB)
		extract_deb $pkg
		;;
	*)
		echo "Unknown package type: $pkg"
		exit 1
	esac
