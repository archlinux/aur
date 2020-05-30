#! /bin/sh

set -e

name="ODAFileConverter_QT5_lnxX64_7.2dll.deb"
dest="/tmp/$name"

wget -N "https://download.opendesign.com/guestfiles/ODAFileConverter/$name" -P "$dest"
new=( $(sha256sum "$dest") )
old=$(grep -oP "sha256sums=\('\K[[:alnum:]]{64}(?=')" PKGBUILD)

if [ "$new" = "$old" ]; then
    echo "No updates!"
    exit 0
fi


ver=$(ar p "$dest" control.tar.xz | tar xJO ./control | grep -oP "Version: \K.+$")
sed -Ei "s/pkgver=[0-9\.]+/pkgver=$ver/
        s/sha256sums=\('[[:alnum:]]{64}/sha256sums=\('$new/" PKGBUILD

source /etc/makepkg.conf
mv "$dest" "$SRCDEST/$name"

makepkg
makepkg --printsrcinfo > .SRCINFO
git commit -a -m "$ver"
git push
