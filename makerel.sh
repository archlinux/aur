#!/bin/bash

function get_md5()
{
    version=$1
    arch=$2

    md5=`curl http://storage.googleapis.com/kubernetes-release/release/v$1/bin/linux/$2/kubectl | md5sum | awk '{print $1}'`

}


if [ "x$1" == "x" ]; then
    echo "Usage: makerel.sh VERSION"
else

    get_md5 $1 386
    md5_386=$md5
    echo "GOT $md5_386 for 386"

    get_md5 $1 amd64
    md5_amd64=$md5
    echo "GOT $md5_amd64 for amd64"

    sed -i.bak -r -e "s/md5sums_i686=.*/md5sums_i686=('$md5_386')/g" \
        -e "s/md5sums_x86_64=.*/md5sums_x86_64=('$md5_amd64')/g" \
        -e "s/pkgver=.*/pkgver=$1/g" PKGBUILD

    makepkg --printsrcinfo > .SRCINFO

fi
