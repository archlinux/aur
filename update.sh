#! /bin/sh

set -e

name="ODAFileConverter_QT5_lnxX64_4.7dll.deb"

wget -N "https://download.opendesign.com/guestfiles/ODAFileConverter/$name" -P /tmp
new=( $(sha256sum "/tmp/$name") )
old=$(grep -oP "sha256sums=\('\K[[:alnum:]]{64}(?=')" PKGBUILD)

if [ "$new" = "$old" ]; then
    echo "No updates!"
    exit 0
fi

ver=$(ar p "/tmp/$name" control.tar.gz | tar xzO ./control | grep -oP "Version: \K.+$")
sed -i "/^pkgver=/s/.+/$ver" PKGBUILD
makepkg -f
makepkg --printsrcinfo > .SRCINFO
git commit -a -m "$ver"
git push
