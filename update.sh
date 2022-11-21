#!/bin/bash

set -eo pipefail

usage() { echo -e "Usage: $0 [-f] [-c]\n  -i : inital build\n  -c : run in cron mode" 1>&2; exit 1; }

cron=
initial=

while getopts ":ic" o; do
    case $o in
    i)
        initial=y
        ;;
    c)
        cron=y
        ;;
    *)
        usage
        ;;
    esac
done

s_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $s_dir

l_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`

if [ ! -d arch-package ] ; then
    git clone -q --single-branch --branch packages/linux https://github.com/archlinux/svntogit-packages.git arch-package
    cd arch-package
else
    cd arch-package
    git checkout -q packages/linux
    git pull -q
fi

c_ver=`grep ^pkgver= repos/core-x86_64/PKGBUILD | cut -d= -f2`

n_ver=`echo -e "$c_ver\n$l_ver" | sort -rV | head -n 1`

if [ $n_ver = $l_ver -a "${initial}x" = "x" ] ; then
    exit
fi

if [ "${initial}x" = "x" ] ; then
    echo "New version available: $c_ver (last build is $l_ver)"
    cp repos/core-x86_64/{config,PKGBUILD} ..
    cd ..

    sed -i -e "s/^pkgbase=.*/pkgbase=linux-bnx2x-2.5g/" PKGBUILD
    sed -i -e '/^makedepends=/{N;n;d}' PKGBUILD
    sed -i -e '/^source=/{N;s/$/\n  "bnx2x_warpcore+8727_2_5g_sgmii_arch.patch"/}' PKGBUILD
    sed -i -e "/^sha256sums=/{s/$/\\n            'd655669179109ae8e801a259c35dbe442ca67a49b9ceb6ca3ef0e56f48149a7d'/}" PKGBUILD
    sed -i -e "s/^  make htmldocs all.*/  make all/" PKGBUILD
    sed -i -e '/^_package-docs() {/,/^}/d' PKGBUILD
    sed -i -e '/^pkgname=/s/ "$pkgbase-docs"//' PKGBUILD
else
    cd ..
    echo "Building version $c_ver (initial)"
fi


echo "Building package"
if [ "${cron}x" = "yx" ] ; then
    time (makepkg --skippgpcheck -CcLm > $s_dir/build.log)
else
    time (makepkg --skippgpcheck -CcLm | tee $s_dir/build.log)
fi

mkdir -p repo
for p in *.pkg.tar.zst; do
    mv $p repo
    repo-add -q -R repo/bnx2x-2.5g.db.tar.zst repo/$p
done

if [ "${initial}x" = "x" ] ; then
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD config .SRCINFO
    git commit -m "Released $c_ver"
    git push -q
fi
