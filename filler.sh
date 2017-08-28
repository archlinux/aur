#!/bin/sh
# Executes 602XML Filler with specified parameters 
# echo "$@"
WHOME="$HOME"/.602filler
OHOME=/usr/lib/602filler/.wine

test -d $WHOME && test ! -e $WHOME/.debrelloc && rm -rf $WHOME/drive_c/windows && rm -rf $WHOME/drive_c/openssl && rm -rf $WHOME/drive_c/Program\ Files
test ! -d $WHOME && mkdir $WHOME
test ! -e $WHOME/.debrelloc && touch $WHOME/.debrelloc
test ! -e $WHOME/user.reg && cp $OHOME/user.reg $WHOME
test ! -e $WHOME/userdef.reg && cp $OHOME/userdef.reg $WHOME
#test ! -e $WHOME/system.reg && cp $OHOME/system.reg $WHOME
cp $OHOME/system.reg $WHOME
test ! -e $WHOME/.update-timestamp && cp $OHOME/.update-timestamp $WHOME

test ! -d $WHOME/drive_c && test -e $WHOME/drive_c && rm -rf $WHOME/drive_c
test ! -d $WHOME/drive_c && mkdir $WHOME/drive_c

#openssl config and random data because of Ubuntu 10.10
test ! -d $WHOME/drive_c/openssl && mkdir $WHOME/drive_c/openssl
test ! -e $WHOME/drive_c/openssl/openssl.cnf && ln -s $OHOME/drive_c/Program\ Files/Software602/602XML/Xmlcore/openssl.cnf $WHOME/drive_c/openssl/openssl.cnf
test   -e $WHOME/drive_c/.rnd && rm $WHOME/drive_c/.rnd 
cp $OHOME/drive_c/.rnd $WHOME/drive_c/.rnd

test ! -d $WHOME/dosdevices && mkdir $WHOME/dosdevices
test -e $WHOME/dosdevices/c\: && rm $WHOME/dosdevices/c\:
ln -s $WHOME/drive_c/ $WHOME/dosdevices/c:
test ! -e $WHOME/dosdevices/x\: && ln -s /tmp/ $WHOME/dosdevices/x:
test ! -e $WHOME/dosdevices/y\: && ln -s $HOME/ $WHOME/dosdevices/y:
test ! -e $WHOME/dosdevices/z\: && ln -s / $WHOME/dosdevices/z:

test -e $WHOME/drive_c/Program\ Files && rm -rf $WHOME/drive_c/Program\ Files
ln -s $OHOME/drive_c/Program\ Files/ $WHOME/drive_c/Program\ Files 

test -e $WHOME/drive_c/windows && rm -rf $WHOME/drive_c/windows
mkdir $WHOME/drive_c/windows
#link files
#ln -s $OHOME/drive_c/windows/acrorun.exe $WHOME/drive_c/windows/acrorun.exe
ln -s $OHOME/drive_c/windows/explorer.exe $WHOME/drive_c/windows/explorer.exe
ln -s $OHOME/drive_c/windows/hh.exe $WHOME/drive_c/windows/hh.exe
#ln -s $OHOME/drive_c/windows/notepad.exe $WHOME/drive_c/windows/notepad.exe
ln -s $OHOME/drive_c/windows/printer.reg $WHOME/drive_c/windows/printer.reg
ln -s $OHOME/drive_c/windows/regedit.exe $WHOME/drive_c/windows/regedit.exe
ln -s $OHOME/drive_c/windows/rundll32.exe $WHOME/drive_c/windows/rundll32.exe
ln -s $OHOME/drive_c/windows/twain_32.dll $WHOME/drive_c/windows/twain_32.dll
ln -s $OHOME/drive_c/windows/winebrowser.exe $WHOME/drive_c/windows/winebrowser.exe
ln -s $OHOME/drive_c/windows/winhelp.exe $WHOME/drive_c/windows/winhelp.exe
ln -s $OHOME/drive_c/windows/winhlp32.exe $WHOME/drive_c/windows/winhlp32.exe
#link dirs
ln -s $OHOME/drive_c/windows/command $WHOME/drive_c/windows/command
#ln -s $OHOME/drive_c/windows/Fonts $WHOME/drive_c/windows/Fonts
ln -s $OHOME/drive_c/windows/fonts $WHOME/drive_c/windows/fonts
ln -s $OHOME/drive_c/windows/inf $WHOME/drive_c/windows/inf
#ln -s $OHOME/drive_c/windows/profiles $WHOME/drive_c/windows/profiles
#ln -s $OHOME/drive_c/windows/system $WHOME/drive_c/windows/system
ln -s $OHOME/drive_c/windows/system32 $WHOME/drive_c/windows/system32
ln -s $OHOME/drive_c/windows/winsxs $WHOME/drive_c/windows/winsxs
#copy files
cp -pr $OHOME/drive_c/windows/system.ini $WHOME/drive_c/windows/
cp -pr $OHOME/drive_c/windows/win.ini $WHOME/drive_c/windows/
chmod 644 $WHOME/drive_c/windows/system.ini
chmod 644 $WHOME/drive_c/windows/win.ini

#create temp dir
mkdir $WHOME/drive_c/windows/temp
test ! -e $WHOME/drive_c/windows/temp/BinFiles602 && mkdir $WHOME/drive_c/windows/temp/BinFiles602 && chmod 700 $WHOME/drive_c/windows/temp/BinFiles602

#test for user profile temp
test -e $WHOME/drive_c/profiles/$USER && {
  test -e $WHOME/drive_c/profiles/$USER/Temp && \
  rm -rf $WHOME/drive_c/profiles/$USER/Temp && \
  mkdir $WHOME/drive_c/profiles/$USER/Temp  
}

#end of creating WHOME - ~/.602filler

#profile might be accessed only by user
chmod -R 700 $WHOME

#nastaveni wine a spusteni fillera
IDIR="/usr/lib/602filler"
export WINEPREFIX="$WHOME"
#export WINESERVER="$IDIR/bin/wineserver"
#export WINELOADER="$IDIR/bin/wine"
#export WINEDLLPATH="$IDIR/lib/wine"
export WINEDLLOVERRIDES="mshtml=;winemenubuilder.exe=;"
#export WINEDEBUG="-all"
#export LD_LIBRARY_PATH="$IDIR/lib;$WHOME/lib;/usr/lib/nss"
wine ~/.602filler/drive_c/Program\ Files/Software602/602XML/Filler/filler602.exe "$@"
