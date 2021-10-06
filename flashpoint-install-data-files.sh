#!/bin/bash

FILENAME="./flashpoint-10-linux-x64.7z"
DOWNLOAD_URL="https://bluepload.unstable.life/flashpoint-10-linux-x64.7z"
VALID_SIGNATURE="af8a8ff804a4d5416e15625f67ab4ad5d6bbb5d0d15e83ff5bdb813a7ddf8de8  $FILENAME"
DOWNLOAD_PATH=~/.cache/flashpoint-data
DOWNLOAD_FULLPATH="$DOWNLOAD_PATH/$FILENAME"
TARGET_PATH=~/.local/share/

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
            echo "Download already found"
						echo "File Signature: $(getfilesignature) $VALID_SIGNATURE"
            if $(checkfilesignature); then
                echo "valid signature > using cached file"
            else
								echo "Invalid signature > redownloading"
                rm -v $FILENAME
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
        echo "Command line tool to install flashpointyay data files\n"
				echo "Commands:"
				echo "install : install with integrity check"
				echo "force-install: install without integrity check"
esac
