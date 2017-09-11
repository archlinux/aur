#!/bin/bash
##########
### $$$$$$ Created By Eden Rose, For (aur)freeablo-git.
### Freeablo Startup
###
### Icon: freeablo_icon.svg
### Executable: freeablo_game
##########

run_dir=$HOME/'.freeablo'
app_dir=/usr/share/freeablo/resources 

if [ ! -e $run_dir ]; then
	mkdir $run_dir
	ln -s "$app_dir/"DIABDAT.MPQ "$run_dir/"
	ln -s "$app_dir/"Diablo.exe "$run_dir/"
	mkdir $run_dir/resources
	ln -s $run_dir/DIABDAT.MPQ  $run_dir/resources/
	ln -s $run_dir/Diablo.exe $run_dir/resources/
fi
if [ ! -e $run_dir/'DIABDAT.MPQ' ]; then
	echo "Diablo Installation is not installed. Please install 'DIABDAT.MPQ' and 'Diablo.exe' into '('$app_dir')'"
	exit
fi

cd $run_dir && exec /usr/bin/freeablo_game
