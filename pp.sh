#!/bin/bash

maxMirrorForDownload=4

arch=$(uname -m)

if [[ $UID -ne 0 ]]; then
	sudo -p 'Restarting as root, password: ' bash $0 "$@"
	exit $?
fi

#read mirrorlist, "Server =" lines, remove all before and including "= " (10 char)
readarray -t mirrorArray < <(grep "^Server =" /etc/pacman.d/mirrorlist | cut -c 10-)

mirrorArrayLen=${#mirrorArray[@]}
let maxParallelDownload=$mirrorArrayLen/$maxMirrorForDownload
echo "mirrorsNumber:$mirrorArrayLen maxParallelDownload:$maxParallelDownload maxMirrorForDownload:$maxMirrorForDownload"

#randomize the order of the mirror
mirrorArray=( $(shuf -e "${mirrorArray[@]}") )

#now get the list of stuff to update
readarray -t packageList < <(checkupdates | cut -d ' ' -f 1,4)

pidToWait=''
mirrorIndex=0
for pkgNameAndVersion in "${packageList[@]}"; do
	pkgName=${pkgNameAndVersion% *}
	
	repoAndArch=($(pacman -Si $pkgName | grep 'Repository      :\|Architecture    :' | cut -c 19-))
	
	repo=${repoAndArch[0]}
	archpkg=${repoAndArch[1]}
	
	downloadList=''
	for (( i=0; i<$maxMirrorForDownload; i++ )); do
		mirror=${mirrorArray[mirrorIndex]}
		pkgNameAndVersion=${pkgNameAndVersion/ /-}
		val=${mirror/\$repo/$repo}
		val=$(echo ${val/\$arch/$arch}/$pkgNameAndVersion-$archpkg.pkg.tar.xz)
		downloadList="$downloadList $val"
		((mirrorIndex++))
		if [[ $mirrorIndex -ge $mirrorArrayLen ]]; then
			mirrorIndex=0
		fi
	done
	
	aria2c -c $downloadList -d /var/cache/pacman/pkg/ &> /dev/null &
	
	running=$(jobs |wc -l)
	echo ">>> $(date +%T) | Downloading $pkgName, $running/$maxParallelDownload download"
	
	while [ $running -ge $maxParallelDownload ]; do
		sleep 0.1 #sleep 0.1 second
		running=$(jobs |wc -l)
	done
done

#now wait for all remaining jobs
echo "all download started, waiting for completition"
wait

if [[ $# -gt 0 ]]; then
	echo "downloads complete, calling $1"
	#DROP PRIVILEDGES
	sudo -s -u $SUDO_USER $1 -Syu --noconfirm
else
	echo "downloads complete, calling pacman"
	pacman -Syu --noconfirm
fi

