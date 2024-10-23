#!/bin/bash

#SudahiDict
SudachiDict_DATE=$(curl -s 'http://sudachi.s3-website-ap-northeast-1.amazonaws.com/sudachidict-raw/' | grep -o '<td>[0-9]*</td>' | grep -o '[0-9]*' | sort -n | tail -n 1)

#ORIGINAL_REPO=fcitx/mozc
ORIGINAL_REPO=$(grep "^url" PKGBUILD | tr -d '"' | sed -e 's|.*com/\(.*\)$|\1|' -e 's|.git$||')
BCR_REPO=bazelbuild/bazel-central-registry
FCITX5_MOZC_COMMIT=$(curl -s https://api.github.com/repos/$ORIGINAL_REPO/commits/fcitx|jq -r ".sha")
BCR_COMMIT=$(curl -s https://api.github.com/repos/$BCR_REPO/commits/main|jq -r ".sha")

# PKGBUILD
COMMIT=$(grep "^_mozc_commit" PKGBUILD|cut -f2 -d"=")
BCR_CURRENT_COMMIT=$(grep "^_bcr_commit" PKGBUILD|cut -f2 -d"=")
SUDACHI_DATE=$(grep "^_sudachidict_date" PKGBUILD|cut -f2 -d"=")

echo $ORIGINAL_REPO
echo "Latest:"
echo "Fcitx5     :" $FCITX5_MOZC_COMMIT
echo "BCR        :" $BCR_COMMIT
echo "SudachiDict:" $SudachiDict_DATE
echo
echo "Current:"
echo "Fcitx5     :" $COMMIT
echo "BCR        :" $BCR_CURRENT_COMMIT
echo "SudachiDict:" $SUDACHI_DATE

UPDATED_FLAG=0
if [[ "$COMMIT" != "$FCITX5_MOZC_COMMIT" ]]; then
    echo "Mozc Updated."
    echo "Current: $COMMIT"
    echo "Latest : $FCITX5_MOZC_COMMIT"
    UPDATED_FLAG=1
fi
if [[ "$SudachiDict_DATE" != "$SUDACHI_DATE" ]];then
    echo "SudachiDict Updated."
    echo "${SUDACHI_DATE}"
    echo "${SudachiDict_DATE}"
    UPDATED_FLAG=1
fi
if [[ "$SudachiDict_DATE" != "$SUDACHI_DATE" ]];then
    sed -i 's|^_sudachidict_date=.*$|_sudachidict_date='"${SudachiDict_DATE}"'|' PKGBUILD*
    rm -f *_lex.zip
    for f in $(ls PKGBUILD*)
    do
        eval $(makepkg -g --noprepare -do -p $f)
        ./update_sha512sums.sh $f "${sha512sums[@]}"
    done
    #mksrcinfo
    git diff
    git commit -a -m "Update: SudachiDict=$SudachiDict_DATE"
fi
if [[ "$COMMIT" != "$FCITX5_MOZC_COMMIT" ]]; then
    sed -i 's|^_mozc_commit=.*$|_mozc_commit='"${FCITX5_MOZC_COMMIT}"'|' PKGBUILD*
    sed -i 's|^_bcr_commit=.*$|_bcr_commit='"${BCR_COMMIT}"'|' PKGBUILD*
    for f in $(ls PKGBUILD*)
    do
        eval $(makepkg -g --noprepare -do -p $f)
        ./update_sha512sums.sh $f "${sha512sums[@]}"
    done
    #mksrcinfo
    git diff
    git commit -a -m "Update: _mozc_commit=$FCITX5_MOZC_COMMIT"
fi
if [[ "$UPDATED_FLAG" == "1" ]]; then
    echo "Change Detected."
    #git push
else
    echo "No change Detected."
fi
./update-submodule.sh
