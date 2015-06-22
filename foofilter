#!/bin/sh
#
# foofilter.sh -- Foomatic-rip-lprng is used as the print filter
#
infile=/tmp/infile.$$
tempfile=/tmp/tempfile.$$

# replace example.ppd with the appropriate ppd file for your printer
your_ppd=$example.ppd

cat > $infile

fileinfo=`file -b $infile`
ascii=`echo $fileinfo | grep ASCII`
pdf=`echo $fileinfo | grep PDF`
ps=`echo $fileinfo | grep PostScript`

if test "$ascii" != ''
then
    enscript -M Letter -o - $infile > $tempfile
elif test "$pdf" != ''
then
    pdftops $infile - > $tempfile
elif test "$ps" != ''
then
    cat $infile > $tempfile
else
    echo "Can not print file of type  $fileinfo" | \
	enscript -M Letter -o - > $tempfile
fi

# foomatic-rip sends stuff to the standard output
/usr/bin/foomatic-rip-lprng --lprng /etc/lprng/lpd/$your_ppd < $tempfile

rm $infile $tempfile
