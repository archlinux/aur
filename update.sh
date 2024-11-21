#!/bin/bash

ORIGINAL_REPO=$(grep "^source" PKGBUILD |grep "git+https"|sed -e "s|.*com/\(.*\)\#commit.*|\1|" -e "s|.git$||")
LATEST_COMMIT=$(curl -s https://api.github.com/repos/$ORIGINAL_REPO/commits/HEAD|jq -r ".sha")
LIBRESSL_LATEST=$(curl -s https://www.libressl.org/releases.html |htmlq -t 'ul li:first-child strong'|cut -f2 -d" ")
LIBRESSL_CURRENT=$(grep "^_libressl_ver" PKGBUILD|cut -d"=" -f2)
echo $ORIGINAL_REPO
echo "Latest  :" $LATEST_COMMIT
echo "LibreSSL:" $LIBRESSL_LATEST
# PKGBUILD
COMMIT=$(grep "^_commit" PKGBUILD|cut -f2 -d"=")
echo "Current :" $COMMIT
echo "LibreSSL:" $LIBRESSL_CURRENT

UPDATED=0
if [[ "$COMMIT" != "$LATEST_COMMIT" ]]; then
    UPDATED=1
    echo "nginx is updated."
fi
if [[ "$LIBRESSL_LATEST" != "$LIBRESSL_CURRENT" ]]; then
    UPDATED=1
    echo "LibreSSL is updated."
fi
if [[ "$UPDATED" == "1" ]];then
    sed -i 's|^_commit=.*$|_commit='"${LATEST_COMMIT}"'|' PKGBUILD
    sed -i 's|^_libressl_ver=.*$|_libressl_ver='"${LIBRESSL_LATEST}"'|' PKGBUILD
    updpkgsums
    makepkg -do --noprepare
    makepkg --printsrcinfo > .SRCINFO
    git diff
    MSG="Update: Nginx\n\n_commit=${LATEST_COMMIT}\n"
    MSG=$MSG"_libressl_ver=${LIBRESSL_LATEST}"
    git commit -a -m "$(echo -e "$MSG")"
    #git push
    #git checkout makepkg
else
    echo "No change detected."
fi
