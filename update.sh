#!/bin/bash

json=$(curl -s https://plus.wps.cn/ops/opsd/api/v1/policy?window_key=wps365_download_edu_pc_muti2)

latest=$(echo "$json" | jq '.data[] | select(.key=="downloadcontent") | .value | fromjson | .[] | select(.downloadtype=="linuxintegrate") | .links[] | select(.arch=="X64") | .packageList[0].link ' -r | grep -oP '\d+\.\d+\.\d+\.\d+' | head -n 1)

source_x86_64=$(echo "$json" | jq '.data[] | select(.key=="downloadcontent") | .value | fromjson | .[] | select(.downloadtype=="linuxintegrate") | .links[] | select(.arch=="X64") | .packageList[0].link ' -r | sed "s/${latest}/\${pkgver}/g")
source_aarch64=$(echo "$json" | jq '.data[] | select(.key=="downloadcontent") | .value | fromjson | .[] | select(.downloadtype=="linuxintegrate") | .links[] | select(.arch=="ARM64") | .packageList[0].link ' -r | sed "s/${latest}/\${pkgver}/g")
source_loong64=$(echo "$json" | jq '.data[] | select(.key=="downloadcontent") | .value | fromjson | .[] | select(.downloadtype=="linuxintegrate") | .links[] | select(.arch=="LoongArch") | .packageList[0].link ' -r | sed "s/${latest}/\${pkgver}/g")

sed -i -e "s/^pkgver=.*/pkgver=${latest}/" PKGBUILD
sed -i -e 's/pkgrel=.*/pkgrel=1/' PKGBUILD
sed -i -e "s|source_x86_64=.*|source_x86_64=(\"${source_x86_64}\")|g" PKGBUILD
sed -i -e "s|source_aarch64=.*|source_aarch64=(\"${source_aarch64}\")|g" PKGBUILD
sed -i -e "s|source_loong64=.*|source_loong64=(\"${source_loong64}\")|g" PKGBUILD
