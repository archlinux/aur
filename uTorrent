#!/bin/bash -e

ClearDumps="yes"  # Clean up "[build]-utorrent.XXXX.dmp" dumps in ~/.uTorrent/
Debug="no"        # Supress _all_ output (even that outside of Wine)

# Set Wine home
if [[ ! $WINEPREFIX ]]; then
    WINEPREFIX=~/.wine
fi

# Symlink uTorrent.exe
if [[ ! -L ~/.uTorrent/uTorrent.exe ]]; then
    install -d ~/.uTorrent/
    ln -s /usr/share/utorrent/uTorrent.exe ~/.uTorrent/uTorrent.exe
fi

# Store settings in ~/.uTorrent/
if [[ ! -f ~/.uTorrent/settings.dat ]]; then
    touch ~/.uTorrent/settings.dat
fi

# Symlink AppData directory to ~/.uTorrent/
appdata="$WINEPREFIX/drive_c/users/$USER/Application Data/uTorrent"
if [[ ! -L $appdata ]]; then
    # Move any settings first
    if [[ -e $appdata ]]; then
        if [[ -f $appdata/settings.dat ]]; then
            cp -r "$appdata/"* ~/.uTorrent/
        fi
        rm -r "$appdata/"
    fi
    ln -sf ~/.uTorrent/ "$appdata"
fi

# Clear piling up memory dumps
if [[ $ClearDumps = yes ]]; then
    rm -f ~/.uTorrent/*.dmp
fi

# Add torrent(s)/magnet link(s)
for i; do # for i = for i in "$@"
    # Add path in Wine form (e.g. "z:/home/user/Desktop/lol.torrent")
    if [[ -f /${i#?:} ]]; then 
        torrents+=("z:${i#?:}")   # When opened through .desktop or Wine path (e.g. z:/*)
    elif [[ $i != 'magnet:'* ]]; then
        torrents+=("z:$(pwd)/$i") # When path only partial or in current directory
    else    # Magnet links
        torrents+=("$i")
    fi
done

# Launch app
if [[ $Debug = no ]]; then
    env WINEPREFIX="$WINEPREFIX" wine ~/.uTorrent/uTorrent.exe "${torrents[@]}" &>/dev/null
else
    env WINEPREFIX="$WINEPREFIX" wine ~/.uTorrent/uTorrent.exe "${torrents[@]}"
fi
