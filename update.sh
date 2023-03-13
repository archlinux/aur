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

git checkout master
git pull -p --ff-only

if git branch -r | grep release/ &>/dev/null; then
    echo "Remote release branch detected ; will not create another, exiting"
    exit
fi

build_ver=`grep ^pkgver= PKGBUILD | cut -d= -f2`
release_ver=`curl --silent "https://api.github.com/repos/dzikoysk/reposilite/releases/latest" | jq -r .tag_name`
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
    git checkout -b release/$new_ver
    git add PKGBUILD .SRCINFO
    git commit -m "Released $new_ver"
    git push -u origin release/$new_ver
    echo "{\"targetProjectId\":21,\"sourceProjectId\":21,\"targetBranch\":\"master\",\"sourceBranch\":\"release/$new_ver\",\"title\":\"Bump version to $new_ver\",\"description\":\"Bump version to $new_ver\",\"mergeStrategy\":\"CREATE_MERGE_COMMIT_IF_NECESSARY\",\"reviewerIds\":[1],\"assigneeIds\":[1]}" | curl -u $TOKEN -d@- -H "Content-Type: application/json" https://onedev.polarian.dev/~api/pulls
    git checkout master
    git branch -D release/$new_ver
    rm reposilite-$new_ver.tar.*
    rm reposilite-$new_ver-1-any.pkg.tar.*
fi
