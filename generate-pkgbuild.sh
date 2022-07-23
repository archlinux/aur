#!/usr/bin/env bash

# Source code:
# - https://github.com/vmware-tanzu/carvel-imgpkg
# - https://github.com/vmware-tanzu/carvel-kapp
# - https://github.com/vmware-tanzu/carvel-kbld
# - https://github.com/vmware-tanzu/carvel-kapp-controller
# - https://github.com/vmware-tanzu/carvel-kwt
# - https://github.com/vmware-tanzu/carvel-vendir
# - https://github.com/vmware-tanzu/carvel-ytt

set -eo pipefail

basedir=$(mktemp -d)
pkgver=$(date +%Y%m%d)
pkgrel=${PKGBUILD_PKGREL:-1}
tools_amd64=(imgpkg kapp kbld kctrl kwt vendir ytt)
# Not all tools provide arm64 builds
tools_arm64=(imgpkg kapp kbld kctrl vendir ytt)
# Architectures recognized by PKGBUILD spec
arches_pkg=(x86_64 aarch64)

set -u

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools: ${tools_amd64[@]}"
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
    local arch_bin=$1
    shift
    local arch_pkg=$1
    shift
    local tools=("$@")

    local project

    for tool in "${tools[@]}"; do
        if [[ $tool == kctrl ]]; then
            project=kapp-controller
        else
            project="$tool"
        fi

        tmp_file="${basedir}/${tool}"
        curl "https://api.github.com/repos/vmware-tanzu/carvel-${project}/releases/latest" -o "${tmp_file}" -C -

        url=$(jq -r '.assets[] | select(.name == "'"${tool}"'-linux-'"${arch_bin}"'").browser_download_url' <"${tmp_file}")
        version=$(jq -r '.name' <"${tmp_file}")
        echo "${tool}-${version}::${url}" >>"${basedir}/_source_${arch_pkg}"

        hashsum=$(jq -r '.body' <"${tmp_file}" | rg -F "linux-${arch_bin}" | awk '{print $1}')
        echo "${hashsum}" >>"${basedir}/_hashsum_${arch_pkg}"
    done

    cat <<EOF
source_${arch_pkg}=(
$(cat "${basedir}/_source_${arch_pkg}")
)
sha256sums_${arch_pkg}=(
$(cat "${basedir}/_hashsum_${arch_pkg}")
)
EOF
}

foo amd64 x86_64 "${tools_amd64[@]}"
foo arm64 aarch64 "${tools_arm64[@]}"

echo "package() {"

for tool in "${tools_amd64[@]}"; do
    bin_name=$(rg "^${tool}[^:]+" -o "${basedir}/_source_x86_64")
    # shellcheck disable=SC2016
    echo '[[ -f "${srcdir}/'"${bin_name}"'" ]] && install -Dm 755 "${srcdir}/'"${bin_name}"'" "${pkgdir}/usr/bin/'"${tool}"'"'
done

echo "}"
