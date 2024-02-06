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

git branch -u origin/master
git pull -p --ff-only

build_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`
release_ver=`curl --silent 'https://api.github.com/repos/dzikoysk/reposilite/releases/latest' | jq -r .tag_name`
new_ver=`echo -e "$release_ver\n$build_ver" | sort -rV | head -n 1`

if [ $new_ver = $build_ver -a "${initial}x" = "x" ] ; then
    exit
fi

if [ "${initial}x" = "x" ] ; then
    echo "New version available: $new_ver (last build is $build_ver)"
    sed -i -e "s/^pkgver=.*/pkgver=$new_ver/" PKGBUILD
    sed -i -e "s/^pkgrel=.*/pkgrel=1/" PKGBUILD
    updpkgsums -m
else
    cd ..
    echo "Building version $build_ver (initial)"
fi

echo "Building package"
if [ "${cron}x" = "yx" ] ; then
    time (makepkg --skippgpcheck -CcLm > $s_dir/build.log)
else
    time (makepkg --skippgpcheck -CcLm | tee $s_dir/build.log)
fi

if [ "${initial}x" = "x" ] ; then
    makepkg --printsrcinfo > .SRCINFO
    git add PKGBUILD .SRCINFO
    git commit -S -m "Released $new_ver-1"
    git push
    git tag -s -m "Bumped version $new_ver" "$new_ver-1"
    git push --tags
    gh release create --generate-notes "$new_ver-1" reposilite-$new_ver-1-any.pkg.tar.*
    rm reposilite-$new_ver.tar.*
    rm reposilite-$new_ver-1-any.pkg.tar.*
    git branch -u aur/master
    git push
    git branch -u origin/master
fi
