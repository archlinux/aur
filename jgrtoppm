#!/bin/sh

border=10
tmp=/tmp/pstopbm$$
tmpa=$tmp.a
(jgraph $*; echo showpage) > $tmp


set foo `psbb $tmp`
shift
llx="$1" lly="$2" urx="$3" ury="$4"
llx=`expr $llx - $border`
lly=`expr $lly - $border`
urx=`expr $urx + $border`
ury=`expr $ury + $border`
width=`expr $urx - $llx`
height=`expr $ury - $lly`

awk 'BEGIN	{ok = 1} 
/^%%BoundingBox/ {if (ok) print $0; next }
{print}
/^%%EndComments/ { if (ok) {ok=0; printf "%d neg %d neg translate\n", '"$llx, $lly"'} } ' $tmp > $tmpa
gs -q -g"${width}x$height" -sDEVICE=ppm -sOutputFile=- -dNOPAUSE $tmpa < /dev/null

rm -f $tmp $tmpa
