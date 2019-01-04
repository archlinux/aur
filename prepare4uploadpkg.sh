#!/usr/bin/env bash
#
# _________        ____  ____________         _______ ___________________
# ______  /__________  |/ /___  ____/________ ___    |__  ____/___  ____/
# _  __  / __  ___/__    / ______ \  ___  __ \__  /| |_  /     __  __/
# / /_/ /  _  /    _    |   ____/ /  __  /_/ /_  ___ |/ /___   _  /___
# \__,_/   /_/     /_/|_|  /_____/   _  .___/ /_/  |_|\____/   /_____/
#                                    /_/        drxspace-4T-gmail.com
#

sum() {
	openssl dgst -sha256 "$1" | sed 's/^.*= //'
}

rplcsum() {
	echo "s/^sha256sums=('.*')/sha256sums=('$(sum "$1")' '$(sum "$2")' '$(sum "$3")' '$(sum "$4")' '$(sum "$5")' '$(sum "$6")')/"
}

rplcrev() {
	echo "s/^_myrevision=.*/_myrevision=$(( ${1}+1 ))/"
}

declare -a _pkgnames=('United-Antergos-Compact.tar.gz'
	'United-Antergos.tar.gz'
	'United-Arch-Compact.tar.gz'
	'United-Arch.tar.gz'
	'United-Manjaro-Compact.tar.gz'
	'United-Manjaro.tar.gz'
)

sed -i "$(rplcrev $(grep "^_myrevision=" PKGBUILD | cut -d= -f2))" PKGBUILD

makepkg --nobuild --skipinteg

sed -i "$(rplcsum ${_pkgnames[*]})" PKGBUILD

rm -rfv src/ United-Arch/ United-*.tar.gz

namcap PKGBUILD && makepkg --printsrcinfo > .SRCINFO || exit 1
git add . || exit 1
git commit -am "Last commit" || exit 1
git push --set-upstream origin master || exit 1

###read -p "Press [Enter] key to exit..."

exit $?
