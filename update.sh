#!/bin/bash

latest=$(curl -s https://plus.wps.cn/ops/opsd/api/v1/policy?window_key=wps365_download_pc_muti | jq '.data[] | select(.key=="downloadcontent") | .value | fromjson | .[] | select(.downloadtype=="linuxintegrate") | .links[] | select(.arch=="X64") | .packageList[0].link ' -r | grep -oP '\d+\.\d+\.\d+\.\d+')

sed -i -e "s/^pkgver=.*/pkgver=${latest}/" PKGBUILD
sed -i -e 's/pkgrel=.*/pkgrel=1/' PKGBUILD
