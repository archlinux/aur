#!/bin/bash
source <(grep = PKGBUILD)

if [ "${pkgver}" == "${1}" ]; then
    echo "Same version as PKGBUILD; nothing to do"
    exit 0
fi

echo "Updating PKGBUILD file with latest upstream release"

sed -i "s/pkgver=${pkgver}/pkgver=${1}/g" PKGBUILD
sed -i "s/${pkgver}/${1}/g" .SRCINFO
source <(grep = PKGBUILD)

for type in source sha256sums; do
    for architecture in ${arch[@]}; do
        if [ "$type" == "source" ]; then
            domain=${type}_${architecture}
            curl -o ${architecture}.tmp ${!domain}
            shasum=$(sha256sum ${architecture}.tmp)
            echo "sha256sums_${architecture}=('${shasum%%[[:space:]]*}')"
            sed -i "s/sha256sums_${architecture}=.*/sha256sums_${architecture}=('${shasum%%[[:space:]]*}')/g" PKGBUILD
            sed -i "s/sha256sums_${architecture} = .*/sha256sums_${architecture} = ${shasum%%[[:space:]]*}/g" .SRCINFO
            rm ${architecture}.tmp
        fi
    done
done
sudo -u nobody makepkg --printsrcinfo > .SRCINFO