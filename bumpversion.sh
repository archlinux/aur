#!/bin/bash

local_version=$(sed -nE 's/pkgver=([0-9\.]+)/\1/p' PKGBUILD)

echo "Search for a version newer than ${local_version} from the https://keepersecurity.com/desktop_electron/desktop_electron_version.txt"
remote_version=$(grep -oP '(?<="version": ")[^"]*'  <(curl -sqL https://keepersecurity.com/desktop_electron/desktop_electron_version.txt))

echo -e ""
echo -e "Versions"
echo -e "-------------------"
echo -e "Remote: | $remote_version"
echo -e "-------------------"
echo -e "Local:  | $local_version"
echo -e "-------------------"

if [[ "$local_version" != "$remote_version" ]]; then

    echo -e "\nNew version released.\n"
    keeperurl="https://www.keepersecurity.com/desktop_electron/Linux/repo/deb/keeperpasswordmanager_${remote_version}_amd64.deb"
    remote_sha512sum=$(curl -sqLo - ${keeperurl} | sha512sum | awk '{print $1}')

    # PKGBUILD
    sed -i "s|^pkgver=.*$|pkgver=${remote_version}|" PKGBUILD
    sed -i "s|^sha512sums=('.*'$|sha512sums=('${remote_sha512sum}'|" PKGBUILD

    makepkg --printsrcinfo > .SRCINFO

    echo -e "PGKBUILD and .SRCINFO have been modified with the newer version, source and sha512sum."
    echo -e "Test the changes:\n"
    echo -e "  makepkg -CL"
    echo -e "  pacman -U keeper-password-manager-${remote_version}-1-x86_64.pkg.tar*"
    echo -e "\nCommit and push the changes to the Aur repository:\n"
    echo -e "  git commit -a -m \"Updated to $remote_version\""
    echo -e "  git push"
else
    echo "No new version"
fi
