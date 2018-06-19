#! /bin/bash

echo $@
BEGIN=1
END=0
filename=""

while getopts b:f:e:h option
do
   case "${option}" in
      b) BEGIN=${OPTARG};;
      f) filename=${OPTARG};;
      e) END=${OPTARG};;
      h) echo "Usage: pdf-remove-blank-pages [-b <FIRST_PAGE>] [-e <LAST_PAGE>] -f <PDF-file>"
                 echo "       [FIRST_PAGE LAST_PAGE] = pages-interval where to remove blank pages ; default is 1-End"
                 echo "       pdf-remove-blank-pages -h : displays that help and exit"
                 exit;;
      *) echo "invalid parameter"
         echo " "
         echo "Usage: pdf-remove-blank-pages [-b <FIRST_PAGE>] [-e <LAST_PAGE>] -f <PDF-file>"
         echo "       [FIRST_PAGE LAST_PAGE] = pages-interval where to remove blank pages ; default is 1-End"
         echo "       pdf-remove-blank-pages -h : displays that help and exit"
         exit;;
   esac
done

if [ $filename == "" ]; then 
  echo "-f <PDF-file> is missing ; aborted"
  exit 99
fi  

if [ $END == 0 ]; then 
  END=$(pdfinfo $filename | grep Pages | awk '{print $2}')
fi  

echo "BEGIN="$BEGIN
echo "END="$END
echo "filename="$filename

  # get non-blank ranges
  ranges="$(pdftotext -f $BEGIN -l $END "$filename" - | \
    "/usr/bin/non-blank-page-ranges.py")"

  if [ -z "$ranges" ]; then
    echo "no non-blank pages found in $filename" >&2
  fi

  # rename pdf
  if [ -e "${filename}.old.pdf" ]; then
    echo "file exists: ${filename}.old.pdf" >&2
  fi

  mv -n "$filename" "${filename}.old.pdf"

  if [ -e "$filename" -o ! -e "${filename}.old.pdf" ]; then
    echo "couldn't rename file $filename" >&2
  fi

  # create new pdf with non-blank pages only
  pdftk "${filename}.old.pdf" cat $ranges output "$filename"
