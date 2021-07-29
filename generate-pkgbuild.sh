#!/usr/bin/env bash

set -eo pipefail

readonly basedir=$(mktemp -d)
readonly pkgver=$(date +%Y%m%d)
readonly pkgrel=${PKGBUILD_PKGREL:-1}
readonly tools_amd64=(ytt kbld kapp kwt imgpkg vendir)
# Not all tools provide arm64 builds
readonly tools_arm64=(ytt kapp vendir)
# Architectures of the tools
readonly arches_bin=(amd64 arm64)
# Architectures recognized by PKGBUILD spec
readonly arches_pkg=(x86_64 aarch64)

set -u

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ${tools_amd64[@]}"
pkgver=${pkgver}
pkgrel=${pkgrel}
url="https://carvel.dev"
arch=(${arches_pkg[@]})
license=(Apache)
provides_x86_64=(${tools_amd64[@]})
provides_aarch64=(${tools_arm64[@]})
conflicts_x86_64=(${tools_amd64[@]})
conflicts_aarch64=(${tools_arm64[@]})

EOF

function foo {
    local arch_bin=$1; shift
    local arch_pkg=$1; shift
    local tools=("$@")

    for tool in "${tools[@]}";
    do
        tmp_file=${basedir}/${tool}
        curl https://api.github.com/repos/vmware-tanzu/carvel-${tool}/releases/latest -o ${tmp_file} -C -

        url=$(jq -r '.assets[] | select(.name == "'${tool}'-linux-'${arch_bin}'").browser_download_url' < ${tmp_file})
        echo "${tool}::${url}" >> ${basedir}/_source_${arch_pkg}

        hashsum=$(jq -r '.body' < ${tmp_file} | rg -F linux-${arch_bin} | awk '{print $1}')
        echo ${hashsum} >> ${basedir}/_hashsum_${arch_pkg}
    done

    cat <<EOF
source_${arch_pkg}=(
$(cat ${basedir}/_source_${arch_pkg})
)
sha256sums_${arch_pkg}=(
$(cat ${basedir}/_hashsum_${arch_pkg})
)
EOF
}

foo amd64 x86_64 "${tools_amd64[@]}"
foo arm64 aarch64 "${tools_arm64[@]}"

echo "package() {"

    for tool in "${tools_amd64[@]}"; do
        echo '[[ -f "${srcdir}/'${tool}'" ]] && install -Dm 755 "${srcdir}/'${tool}'" "${pkgdir}/usr/bin/'${tool}'"'
    done

echo "}"
