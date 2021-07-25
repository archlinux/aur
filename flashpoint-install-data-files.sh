#!/bin/bash

FILENAME="./infinity-data-8-2-2b.7z"
DOWNLOAD_URL="https://bluepload.unstable.life/selif/infinity-data-8-2-2b.7z"
VALID_SIGNATURE="73ba75598b352244e4a0fda80800fcd1c99f8d98723a83cb495d152f28fcdfed  $FILENAME"
DOWNLOAD_PATH=~/.cache/flashpoint-data
DOWNLOAD_FULLPATH="$DOWNLOAD_PATH/$FILENAME"
TARGET_PATH=~/.local/share/flashpoint

downloaddata(){
    echo "Downloading to $DOWNLOAD_FULLPATH"
    wget $DOWNLOAD_URL
}

getfilesignature(){
    sha256sum $FILENAME
}

printfilesignature(){
    printf "Actual file signature: \n$(getfilesignature)\nExpected file signature: \n$VALID_SIGNATURE\n"
}

checkfilesignature(){
    if [ "$(getfilesignature)" = "$VALID_SIGNATURE" ]; then
        echo true
    else
        echo false
    fi
}

unpackfiles(){
    echo "Unpacking files ..."
    mkdir -p $TARGET_PATH
    7z x $FILENAME -o$TARGET_PATH -aoa
}

installwithcheck(){
        mkdir -p $DOWNLOAD_PATH
        cd $DOWNLOAD_PATH
# Download Archive
        echo "Downloading data ..."
        if [ -f $FILENAME ]; then
            echo "File already found"
            if $(checkfilesignature); then
                echo "valid signature > using cached file"
            else
                echo "Invalid signature > redownloading"
                rm $FILENAME
                downloaddata
            fi
        else 
            downloaddata
        fi
        printfilesignature
# Extract archive
        if $(checkfilesignature) ; then
            echo "Valid signature"
            unpackfiles
        else
            echo "invalid file signature"
        fi
}

case $1 in
    'install' )
        installwithcheck
    ;;
    'force-install' )
        rm -f $FILENAME
        downloaddata
        unpackfiles
    ;;
#    check' )
#        if [ -f $TARGET_PATH/flashpoint.sqlite ]
#    ;;
    * )
        printf "Command line tool to install package files \nCommands:\ninstall : install with integrity check\nforce--install: install without integrity check"
esac
