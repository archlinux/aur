#!/bin/bash
TMPDIR=/tmp
DVI2GR=dvi2gr
# Not sure where this is supposed to be relative to
FPATH="fonts/type1"
LATEX=latex

input=$1

if [ $input == "--help" ]; then
	echo "Usage: tex2gr <latex_snippet>"
	echo "Snippet should begin and end with '$' if it contains math"
	exit 0
fi

bname=$TMPDIR/dvi2gr$$
itex=$bname.tex
idvi=$bname.dvi
iaux=$bname.aux
ilog=$bname.log

istr=`sed 's/\\\\/\\\\\\\\/g' $input`

cat << EOPRE > $itex
\documentclass[10pt]{article}
\pagestyle{empty}
\begin{document}
EOPRE

cat $input >> $itex

cat << EOPOST >> $itex
\end{document}
EOPOST

$LATEX --output-directory=$TMPDIR/ $itex > /dev/null
ostr=`$DVI2GR $FPATH $idvi`

echo "$ostr"

rm -f $itex $idvi $iaux $ilog
