#!/bin/bash
# Copyright (c) 2011 Josh Schreuder
# http://www.postteenageliving.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# ********************************
# *** OPTIONS
# ********************************
# Set this to 'yes' to save a description (to ~/description.txt) from APOD page
GET_DESCRIPTION="yes"
# Set this to the directory you want pictures saved
PICTURES_DIR=~/Pictures
# Set this to the directory you want description saved
DESCRIPTION_DIR=/tmp

# ********************************
# *** FUNCTIONS
# ********************************
function get_page {
    echo "Downloading page to find image"
    wget http://apod.nasa.gov/apod/ --quiet -O /tmp/apod.html
    grep -m 1 jpg /tmp/apod.html | sed -e 's/<//' -e 's/>//' -e 's/.*=//' -e 's/"//g' -e 's/^/http:\/\/apod.nasa.gov\/apod\//' > /tmp/pic_url
}

function save_description {
    if [ ${GET_DESCRIPTION} == "yes" ]; then
        echo "Getting description from page"
        # Get description
        if [ -e $DESCRIPTION_DIR/description.txt ]; then
            rm $DESCRIPTION_DIR/description.txt
        fi

        if [ ! -e /tmp/apod.html ]; then
            get_page
        fi

        echo "Parsing description"
        sed -n '/<b> Explanation: <\/b>/,/<p> <center>/p' /tmp/apod.html |
        sed -e :a -e 's/<[^>]*>//g;/</N;//ba' |
        grep -Ev 'Explanation:' |
        tr '\n' ' ' |
        sed 's/  /\n\n/g' |
        awk 'NF { print $0 "\n" }' |
        sed 's/^[ \t]*//' |
        sed 's/[ \t]*$//' > $DESCRIPTION_DIR/description.txt
    fi
}

function clean_up {
    # Clean up
    echo "Cleaning up temporary files"
    if [ -e "/tmp/pic_url" ]; then
        rm /tmp/pic_url
    fi

    if [ -e "/tmp/apod.html" ]; then
        rm /tmp/apod.html
    fi
}

# ********************************
# *** MAIN
# ********************************
echo "===================="
echo "== APOD Wallpaper =="
echo "===================="
# Set date
TODAY=$(date +'%Y%m%d')

# If we don't have the image already today
if [ ! -e ~/Pictures/${TODAY}_apod.jpg ]; then
    echo "We don't have the picture saved, save it"

    get_page

    # Got the link to the image
    PICURL=`/bin/cat /tmp/pic_url`

    echo  "Picture URL is: ${PICURL}"

    echo  "Downloading image"
    wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_apod.jpg

    echo "Setting image as wallpaper"
    gsettings set org.gnome.desktop.background picture-uri file:///$PICTURES_DIR/${TODAY}_apod.jpg

    save_description

# Else if we have it already, check if it's the most updated copy
else
    get_page

    # Got the link to the image
    PICURL=`/bin/cat /tmp/pic_url`

    echo  "Picture URL is: ${PICURL}"

    # Get the filesize
    SITEFILESIZE=$(wget --spider $PICURL 2>&1 | grep Length | awk '{print $2}')
    FILEFILESIZE=$(stat -c %s $PICTURES_DIR/${TODAY}_apod.jpg)

    # If the picture has been updated
    if [ $SITEFILESIZE != $FILEFILESIZE ]; then
        echo "The picture has been updated, getting updated copy"
        rm $PICTURES_DIR/${TODAY}_apod.jpg

        # Got the link to the image
        PICURL=`/bin/cat /tmp/pic_url`

        echo  "Downloading image"
        wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_apod.jpg

        echo "Setting image as wallpaper"
        gconftool-2 -t string -s /desktop/gnome/background/picture_filename $PICTURES_DIR/${TODAY}_apod.jpg

        save_description

    # If the picture is the same
    else
        echo "Picture is the same, finishing up"
    fi
fi

clean_up
