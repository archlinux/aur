#!/bin/bash

printf "$(tput setaf 1)$(tput bold)  ==> WARNING: $(tput sgr0)"
echo "List of packages which are linked against legacy xfconf (4.12.x)"
echo "Please rebuild manually."
echo "pacman -Sb <package>"
pkgs=( $( echo "`pacman -Qoq /usr/include/xfce4` `pacman -Qoq /usr/lib/xfce4`" | grep -v xfconf-devel | sort -u ) )
for pkg in ${pkgs[@]} ; do
	mapfile -t files < <(pacman -Qlq $pkg | grep -v /$)
	grep -Fq 'libxfconf-0.so.2' "${files[@]}" <&- 2>/dev/null && echo "  >> $pkg"
done
