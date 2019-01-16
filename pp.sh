#!/bin/bash

if [[ $UID -ne 0 ]]; then
    sudo -p 'Restarting as root, password: ' bash $0 "$@"
    exit $?
fi

#read mirrorlist, "Server =" lines, remove all before and including "= " (10 char)
readarray -t mirrorArray < <(grep "^Server =" /etc/pacman.d/mirrorlist | cut -c 10-)

#randomize the order of the mirror
mirrorArray=( $(shuf -e "${mirrorArray[@]}") )

#now get the list of stuff to update
readarray -t packageList < <(checkupdates | cut -d ' ' -f 1,4)

pidToWait=''

for pkgNameAndVersion in "${packageList[@]}"; do
	pkgName=${pkgNameAndVersion% *}
	
	#echo "pkgName $pkgName"
	
	repoAndArch=($(pacman -Si $pkgName | grep 'Repository      :\|Architecture    :' | cut -c 19-))
	
	repo=${repoAndArch[0]}
	archpkg=${repoAndArch[1]}
	
	arch='x86_64'
	
	downloadList=''
	for mirror in "${mirrorArray[@]}"; do
		pkgNameAndVersion=${pkgNameAndVersion/ /-}
		val=${mirror/\$repo/$repo}
		val=$(echo ${val/\$arch/$arch}/$pkgNameAndVersion-$archpkg.pkg.tar.xz)
		#echo - $repo - $arch - $val - $mirror
		downloadList="$downloadList $val"
	done
	
	#echo $downloadList
	aria2c -c $downloadList -d /var/cache/pacman/pkg/ &> /dev/null &

	running=$(jobs |wc -l)
  echo ">>> $(date +%T) | Downloading $pkgName, $running/10 download"
  
	while [ $running -gt 10 ]; do
		sleep 0.1 #sleep 0.1 second
		running=$(jobs |wc -l)
	done

done

#now wait for all remaining jobs
echo "all download started, waiting for completition"
wait

if [[ $# -gt 0 ]]; then
	#DROP PRIVILEDGES
	sudo -s -u $SUDO_USER $1 -Syu --noconfirm
else
	echo "downloads complete, calling pacman"
	pacman -Syu --noconfirm
fi

