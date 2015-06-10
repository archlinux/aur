#!/bin/sh
export WINEARCH=win32
mkdir -p "$HOME/.local/share/wineprefixes/"
export WINEPREFIX=$HOME/.local/share/wineprefixes/osu
export WINEDEBUG=-all
export PULSE_LATENCY_MSEC=22

function doinstall {
echo "Installing osu!"
echo

if [ -d $HOME/.osu ]
then
while true
do
read -p "$HOME/.osu exists, would you like to move it to $WINEPREFIX? (Will assume that the wineprefix is configured correctly) [Y/n] " yn
case $yn in
""|[Yy]* )
rm -r $WINEPREFIX &>/dev/null
mv $HOME/.osu $WINEPREFIX
/opt/osu/osulauncher & exit;;
[Nn]* ) break;;
* ) echo "Please answer y or n.";;
esac
done
fi
# maybe this should test $XDG_DATA_HOME?
if [ -f $HOME/.local/share/applications/wine-extension-osz.desktop ]
then
sed -i "s:$HOME/.osu:$WINEPREFIX:" $HOME/.local/share/applications/wine-extension-*.desktop
fi

echo "Creating wineprefix..."
echo "Do NOT install Mono (press cancel)!"
wine hh || exit 1
echo "Wineprefix created successfully!"
echo "Installing .NET 2.0 and gdi"
if [ -z $(which winetricks) ]
then
echo "Install failed. Please install winetricks."
read
exit 1
fi
winetricks dotnet20sp2 gdiplus || (doremove && exit 1)
echo ".NET 2.0 and gdi instlled successfully!"
echo
echo "Applying some settings..."
winetricks ddr=opengl fontsmooth=rgb sound=alsa strictdrawordering=enabled
regedit /opt/osu/directsound-latency.reg
echo "All done! Running osu! updater..."
sleep 10
wine /opt/osu/game/osu\!install.exe
}

function doremove {
echo "Removing wineprefix..."
rm -rf "$WINEPREFIX"
}


case "$1" in
"install")
 doinstall
 exit 0
 ;;

"remove")
 doremove
 exit 0
 ;;

"reinstall")
 doremove
 doinstall
 exit 0
 ;;

"winecfg")
 winecfg
 exit 0
 ;;

"regedit")
 regedit
 exit 0
 ;;

"winetricks")
 winetricks
 exit 0
 ;;
esac

if [ ! -d "$WINEPREFIX" ]
then
if [ ! -t 0 ]
then
xterm -e "/opt/osu/osulauncher install"
else
doinstall
exit 0
fi
fi

if [ "$1" == "fullscreen" ]
then
RES=$(xrandr | grep +0 | awk '{print $3}' | sed 's/+0+0//')
vblank_mode=0 wine explorer /desktop=osu,$RES /opt/osu/game/osu\!.exe $@
else
vblank_mode=0 wine /opt/osu/game/osu\!.exe $@
fi
