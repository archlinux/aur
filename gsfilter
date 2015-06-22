#!/bin/sh
#
# gsfilter.simple -- HP deskjet or similar sample filter
#
# Requires pdftops from the xpdf package, the ghostscript package, and
# the enscript package.
#
# define temporary files
infile=/tmp/infile.$$
tempfile=/tmp/tempfile.$$
outfile=/tmp/outfile.$$

# choose your paper size
GSPAPER=letter
#GSPAPER=a4
PAPER=Letter
#PAPER=A4

# chose your printer device (run gs -h to see what is available)
DEVICE=cdjcolor

# send the standard input to a temporary file
cat > $infile

# figure out what type of file we are trying to print
fileinfo=`file -b $infile`
ascii=`echo $fileinfo | grep ASCII`
pdf=`echo $fileinfo | grep PDF`
ps=`echo $fileinfo | grep PostScript`

# take various actions depending on the type of file -- send
# results to a temporary postscript file
if test "$ascii" != ''
then
    enscript -M $PAPER -o - $infile > $tempfile
elif test "$pdf" != ''
then
    pdftops -paper match $infile - > $tempfile
elif test "$ps" != ''
then
    cat $infile > $tempfile
else
    echo "Cannot print file of type  $fileinfo" | \
	enscript -M $PAPER -o - > $tempfile
fi

# run the postscript through gs to produce device output in a file
echo quit | gs -sOutputFile=$outfile -q -sPAPERSIZE=$GSPAPER -dSAFER \
    -dNOPAUSE -sDEVICE=$DEVICE $tempfile > /dev/null 2> /dev/null

# send output file to standard out
cat $outfile

# clean up
rm $infile $tempfile $outfile
