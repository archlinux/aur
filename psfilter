#!/bin/sh
#
# psfilter.simple -- Convert pdf and text to postscript.  Control of
# duplexing for postscript files is via the insertion of a duplexing
# control line as the second line of the postscript file.  This seems
# to work for pdftops, pdf2ps, and cairo output.  It doesn't work for
# postscript files created by enscript.  Instead, enscript duplexing
# is controlled by a command line option in enscript.  Duplex on pdf
# files is controlled by a pdftops flag.
#
# Needs pstopdf from xpdf and enscript.
#
# set paper type
PAPER=Letter
#PAPER=A4

# define whether duplex is desired by uncommenting appropriate lines
#duplex=false
duplex=true
#duplexflag=
duplexflag=-duplex

# define temporary files
infile=/tmp/infile.$$
tmpfile=/tmp/tmpfile.$$
headfile=/tmp/headfile.$$
tailfile=/tmp/tailfile.$$

# touch files so if not used, cleanup doesn't complain
touch $tmpfile
touch $headfile
touch $tailfile

# send standard input to temporary file
cat > $infile

# figure out the type of file
fileinfo=`file -b $infile`
ascii=`echo $fileinfo | grep ASCII`
pdf=`echo $fileinfo | grep PDF`
ps=`echo $fileinfo | grep PostScript`

# do conversions to postscript based on file type and put in tmpfile
if test "$ascii" != ''
then
    enscript -DDuplex:$duplex -M $PAPER -o - $infile
elif test "$pdf" != ''
then
    pdftops -paper match $duplexflag $infile -
elif test "$ps" != ''
then

    # are we doing duplex?  if so, insert a special string in postscript file
    if test "$duplex" = true
    then
	sed -e "1 w $headfile" -e "2,$ w $tailfile" < $infile > /dev/null
	cat $headfile > $tmpfile
	echo "<< /Duplex true >> setpagedevice" >> $tmpfile
	cat $tailfile >> $tmpfile
    else

	# if not duplex, don't do anything
	cat $tailfile >> $tmpfile
    fi

    # send the file to standard output
    cat $tmpfile
else
    echo "Cannot print file of type  $fileinfo" | \
	enscript -DDuplex:$duplex -M $PAPER -o -
fi

# clean up
rm $infile $tmpfile $headfile $tailfile
