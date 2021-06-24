#!/bin/bash -e

# Original Script: https://www.isticktoit.net/?p=1536
# Adapted for the L5 use case with gnome-contacts

#Selecting a file

FILE=`yad --title "Import Contacts" --text="Select a VCF file to import" --file=`

if [ "$FILE" == "" ]; then
    `yad --title "Import Contacts" --text="You did not selected any file"` exit 1
fi

notify-send -t 1000 "Import Contacts" "Importing Contacts from $FILE"

#Name of the database where the contacts will be imported to.
CONTACTDB=$(syncevolution --print-databases | grep "system-address-book"| sed 's#(.*##' | sed 's# ##g' )

#Temp directory to mess with files:

TEMP=$(mktemp -d -t contacts-importer-XXXXXXXXXXXXX-$(date +%Y-%m-%d-%H-%M-%S))

#Some control info to make sure the file is a vcard

MIMETYPE=$(file --mime-type -b $FILE)
CONTROL="text/vcard"

if [[ "$MIMETYPE" != "$CONTROL" ]]; then
    notify-send -t 1000 "File is not a vcard! Bye!" && exit 1
fi

#Begin importing contacts

cd $TEMP

cat $FILE | awk ' /BEGIN:VCARD/ { ++a; fn=sprintf("card_import_L5_%02d.vcf", a); print "Writing: ", fn } { print $0 >> fn; } ' $1

for f in $TEMP/card_import_L5* 
do syncevolution --import ${f%} backend=evolution-contacts database=${CONTACTDB} 
done

if [ $? -eq 0 ]
then
    notify-send "Successful import";
    exit 0
else
    notify-send "Error" >&2
    exit 1
fi
