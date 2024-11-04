#!/bin/bash

BASE=$PWD
mkdir -p tmp
git clone mozc tmp/mozc
(cd tmp/mozc; git fetch;git submodule update --init)
source $BASE/PKGBUILD
UPDATED=0
for url in $(echo ${source[@]}|xargs -n1|grep "^git"|sed -e 's/git+//' -e 's/#commit=.*//'|grep -vE 'dict-to-mozc|mozc|bcr')
do
    d=${url##*/}
    d=${d%.git}
    [[ "$d" == "googletest" ]] && d=gtest
    r=${d//-/_}
    CURRENT=$(grep -E "^_${r}_commit" PKGBUILD)
    [[ "$d" == "japanese-usage-dictionary" ]] && d=${d//-/_}
    LATEST=$(cd tmp/mozc/src/third_party/$d; git fetch;echo "_${r}_commit="$(git log -1 --pretty=%h))
    echo $CURRENT
    echo $LATEST
    if [[ $CURRENT != $LATEST ]];then
        UPDATED=1
        echo "submodule ${d} is changed."
        echo sed -i 's|^_'"${r}"'_commit=.*$|'"${LATEST}"'|' PKGBUILD*
        sed -i 's|^_'"${r}"'_commit=.*$|'"${LATEST}"'|' PKGBUILD*
    fi
done
if [[ $UPDATED == 1 ]];then
    echo "submodule checksum is updated."
    for f in $(ls PKGBUILD*)
    do
        eval $(makepkg -g --noprepare -do -p $f)
        ./update_sha512sums.sh $f "${sha512sums[@]}"
    done
fi
