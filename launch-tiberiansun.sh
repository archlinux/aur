#!/bin/bash

# Assuming the script is under this dir
DIR="/opt/tiberiansun"

usrdir="$HOME/.tiberiansun"
prefixdir="$usrdir/tiberiansun"
gamedir="$prefixdir/drive_c/Program Files/EA Games/Command & Conquer The First Decade/Command & Conquer(tm) Tiberian Sun(tm)/SUN"

export WINEARCH='win32'
export WINEPREFIX="$prefixdir"

launchgame() {
    cd "$gamedir"
    if ! [ "$?" -eq 0 ]
    then
        echo "ERROR: Couldn't cd into game working directory."
        echo "Examine '$gamedir'."
        echo "Delete '$usrdir' and re-execute this script to recreate it."
        return 1
    fi

    # Running explorer is a small hack to get windowed mode working correctly
    # without having to change the X11 screen colour depth. The resolution can
    # be adjusted in-game, and sticks for future runs. Running the game
    # non-windowed causes a variety of graphical glitches.
    WINEDEBUG='-all' wine explorer /desktop=tiberiansun,800x600 ./SUN.EXE
    exitcode="$?"

    if ! [ "$exitcode" -eq 0 ]
    then
        echo "wine exited abnormally. It's possible that the WINEPREFIX needs to be recreated."
        echo "Delete '$usrdir' and re-execute this script to recreate the WINEPREFIX dir."
        echo "Make sure to backup any saved games that directory contains before deleting it."
        return $exitcode
    fi
    return 0
}


createprefix() {
    # Set up basic stuff with wineboot
    echo ">>> wineboot"
    mkdir "$usrdir"
    wineboot
    if ! [ "$?" -eq 0 ]
    then
        echo "wineboot exited abnormally. Can't create the wineprefix at '$prefixdir'."
        return 1
    fi

    # Prepare copies/symlinks of files required by the game
    mkdir -p "$gamedir"

    respath="$DIR/SUN"

    echo ">>> Game files"
    # Files that are written to
    cp "$respath/SUN.INI" "$gamedir/"
    cp "$respath/Woldata.key" "$gamedir/"

    # Files/subdirs that are only ever read
    readonlyFiles=$(ls -1 "$respath/" | grep -vE 'SUN\.INI|Woldata\.key')
    for file in $readonlyFiles
    do
        ln -s -T "$respath/$file" "$gamedir/$file"
    done

    echo ">>> MS Components"
    # Install DirectX (minimum version is 6)
    winetricks d3dx9

    echo ">>> Multiplayer"
    # Multiplayer setup
    mkdir -p "$gamedir/Internet/"
    cp "$DIR/Internet/NL.CFG" "$gamedir/Internet/"
    cp "$DIR/Internet/WOLAPI.INI" "$gamedir/Internet/"
    readonlyFiles=$(ls -1 "$DIR/Internet" | grep -vE 'NL\.CFG|WOLAPI\.INI')
    for file in $readonlyFiles
    do
        ln -s -T "$DIR/Internet/$file" "$gamedir/Internet/$file"
    done

    wine regedit "$gamedir/Internet/tibsun_regadd.reg" || echo "regedit failed"
    pushd "$gamedir/Internet" >/dev/null
    wine regsvr32 WOLAPI.dll
    wine regsvr32 WOLBrowser.dll
    popd >/dev/null

    # Resolution
    echo ">>> Enable high resolution screen support"
    sed -i -e 's/\[Video\]/[Video]\r\nAllowHiResModes=true/' "$gamedir/SUN.INI"

    # TODO Speed decrease?
}


# Create the directory if it does not exist, then run the game.
if ! [ -d $usrdir ]
then
    echo "Creating wineprefix for the game. This only needs to be done once, future runs will skip this step."
    # Don't continue if there's an error when creating the prefix
    createprefix || exit $?
    echo "Wineprefix creation complete, running the game."
fi

launchgame
exit $?
