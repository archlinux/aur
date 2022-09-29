#!/bin/bash
# use crontab to auto update version
# */7 * * * * ./auto_update_version.sh
# get the latest release from github and commit change to aur

cd $( dirname -- "$( readlink -f -- "$0" )" )

aur_ver=$(cat PKGBUILD | grep "^pkgver=" | sed 's/pkgver=//')
github_ver=$(curl --max-time 5 -sL https://api.github.com/repos/Noovolari/leapp/releases/latest | jq -r ".tag_name" | sed 's/v//g')

if [ -z ${github_ver} ] || [ -z ${aur_ver} ]; then
    echo "runing error, could not get the right version" && exit 1
fi

if [ "${aur_ver}" == "${github_ver}" ]; then
    echo "leapp in aur already has the latest version."
else
    for exist_ver in `cat exist_vers`; do
        if [ "${exist_ver}" == "${github_ver}" ]; then
            echo "looks like the latest release from github is already exist." && exit 2
        fi
    done
    rm -f Leapp_*_amd64.deb
    wget https://asset.noovolari.com/${github_ver}/Leapp_${github_ver}_amd64.deb || echo "can't download https://asset.noovolari.com/${github_ver}/Leapp_${github_ver}_amd64.deb"  && exit 3
    sha512sum=$(sha512sum Leapp_${github_ver}_amd64.deb | awk '{printf $1}')
    cp PKGBUILD.tpl PKGBUILD
    cp .SRCINFO.tpl .SRCINFO
    sed -i "s/VERSION/${github_ver}/g" PKGBUILD
    sed -i "s/VERSION/${github_ver}/g" .SRCINFO
    sed -i "s/SHA512SUMS/${sha512sum}/g" PKGBUILD
    sed -i "s/SHA512SUMS/${sha512sum}/g" .SRCINFO
    git add .SRCINFO PKGBUILD
    git commit -m "auto update to ${github_ver}"
    git push
    rm -f Leapp_${github_ver}_amd64.deb
    echo "${github_ver}" >> exist_vers
fi
