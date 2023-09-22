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
    git clone -q https://gitlab.archlinux.org/archlinux/packaging/packages/linux.git arch-package
    cd arch-package
else
    cd arch-package
    git checkout -q main
    git pull -q
fi

c_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`

n_ver=`echo -e "$c_ver\n$l_ver" | sort -rV | head -n 1`

if [ $n_ver = $l_ver -a "${initial}x" = "x" ] ; then
    exit
fi

if [ "${initial}x" = "x" ] ; then
    echo "New version available: $c_ver (last build is $l_ver)"
    cp {config,PKGBUILD} ..
    cd ..

    sed -i -e 's/# Maintainer/# Contributor/' \
           -e '1s/^/# Maintainer: Charles Leclerc <charles@la-mouette.net>\n/' \
           -e 's/^pkgbase=.*/pkgbase=linux-bnx2x-2.5g/' \
           -e '/pkgdesc=/s/"$/ with 2.5G patch for bnx2x module"/' \
           -e '/\s*# htmldocs/,/^)/{/^)/!d;}' \
           -e '/^source=/{N;s/$/\n  "bnx2x_warpcore+8727_2_5g_sgmii_arch.patch"/}' \
           -e "/^b2sums=/{N;s/$/\n        '94fd2e2fa31da0ce9d04e639b0fafc37128ad2f01f8ee38708c7128fdc1568e491aca9a8296316b0736f134dc7697b573e8203018d92c1e9b6ff40648501607a'/}" \
           -e "/^sha256sums=/{N;s/$/\n            'd655669179109ae8e801a259c35dbe442ca67a49b9ceb6ca3ef0e56f48149a7d'/}" \
           -e  '/^  make htmldocs$/d' \
           -e "s/^  make all$/  make -j $(($(nproc)*2)) all/" \
           -e '/^_package-docs() {/,/^}/d' \
           -e '/\s*"$pkgbase-docs"/d' PKGBUILD
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

mkdir -p ../repo
for p in *.pkg.tar.zst; do
    mv $p ../repo
    repo-add -q -R ../repo/bnx2x-2.5g.db.tar.zst ../repo/$p
done

if [ "${initial}x" = "x" ] ; then
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD config .SRCINFO
    git commit -m "Released $c_ver"
    git push -q
fi
