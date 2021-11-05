#!/bin/bash

set -eo pipefail

s_dir="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd $s_dir/arch-package

git checkout -q packages/linux
git pull -q
c_ver=`grep ^pkgver= repos/core-x86_64/PKGBUILD | cut -d= -f2`
git checkout -q bnx2x-2.5g
l_ver=`grep ^pkgver= repos/core-x86_64/PKGBUILD | cut -d= -f2`

if [[ $c_ver < $l_ver || $c_ver == $l_ver ]] ; then
    exit
fi

echo "New version available: $c_ver (last build is $l_ver)"

sed -i -e "s/^pkgbase=.*/pkgbase=linux/" -e "s/^pkgver=.*/pkgver=$c_ver/" repos/core-x86_64/PKGBUILD
git add repos/core-x86_64/PKGBUILD
git commit -q -m "Prepare for $c_ver merge"
git merge --no-edit -q packages/linux
sed -i -e "s/^pkgbase=.*/pkgbase=linux-bnx2x-2.5g/" repos/core-x86_64/PKGBUILD
git add repos/core-x86_64/PKGBUILD
git commit -q -m "$c_ver release"

cp -f repos/core-x86_64/PKGBUILD ..
cp -f repos/core-x86_64/config ..

cd ..

echo "Building package"
time (makepkg --skippgpcheck -CcL) # > /dev/null)

for p in *.pkg.tar.zst; do
    mv $p repo
    repo-add -q -R repo/bnx2x-2.5g.db.tar.zst repo/$p
done

makepkg --printsrcinfo > .SRCINFO
git add PKGBUILD config .SRCINFO
git commit -m "Released $c_ver"
git push -q
