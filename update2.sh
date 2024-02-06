#!/bin/bash

set -eo pipefail +H

DEB_REPO=https://repos.tixeo.com/debian
SUITE=bullseye
COMPONENT=non-free
ARCH=amd64
PACKAGE=tixeoclient

s_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $s_dir

built_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`

t_packages=`mktemp`
trap 'rm -f $t_packages' EXIT
curl -Ls $DEB_REPO/dists/$SUITE/$COMPONENT/binary-$ARCH/Packages | sed -n -e "/^Package: $PACKAGE$/,/^$/{/^$/!p}" > $t_packages

upstream_ver=`grep "^Version:" $t_packages | sed -e 's/\w\+: //'`

if [ -z "$upstream_ver" ] ; then
    echo "Unable to retrieve latest upstream $PACKAGE version"
    exit 1
fi

if [ $upstream_ver = $built_ver ] ; then
    exit
fi

echo "New upstream version available : $upstream_ver (last build is $built_ver)"

sed -i -e "s/^pkgver=.*/pkgver=$upstream_ver/" PKGBUILD
sed -i -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
updpkgsums -m

echo "Building package"
makepkg --skippgpcheck -CcLmfd | tee $s_dir/build.log

# Build is successful, will push to aur
makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD .SRCINFO
git commit -m "Released $upstream_ver"
git push
