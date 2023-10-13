#!/usr/bin/env bash

# Source code:
# - https://github.com/carvel-dev/imgpkg
# - https://github.com/carvel-dev/kapp
# - https://github.com/carvel-dev/kbld
# - https://github.com/carvel-dev/kapp-controller
# - https://github.com/carvel-dev/kwt
# - https://github.com/carvel-dev/vendir
# - https://github.com/carvel-dev/ytt

set -eo pipefail

tmp_pkgbuild=$(mktemp)

basedir=$(mktemp -d)
pkgver=$(date +%Y%m%d)
pkgrel=${PKGBUILD_PKGREL:-1}
tools=(imgpkg kapp kbld kctrl kwt vendir ytt)
# Architectures recognized by PKGBUILD spec
arches_pkg=(x86_64 aarch64)

set -u

cat <<EOF >"${tmp_pkgbuild}"
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel tools (binaries): ${tools[@]}"
pkgver=${pkgver}
pkgrel=${pkgrel}
url="https://carvel.dev"
arch=(${arches_pkg[@]})
license=(Apache)
provides=(${tools[@]})
conflicts=(${tools[@]})

EOF

for tool in "${tools[@]}"; do
    if [[ $tool == kctrl ]]; then
        project=kapp-controller
    else
        project="$tool"
    fi

    tmp_file="${basedir}/${tool}"
    gh release view \
        --repo "carvel-dev/${project}" \
        --json assets,body,name,publishedAt \
        >"${tmp_file}"

    for arch_pkg in "${arches_pkg[@]}"; do
        case "${arch_pkg}" in
            x86_64) arch_bin=amd64 ;;
            aarch64) arch_bin=arm64 ;;
        esac

        jq --raw-output \
            --exit-status \
            --arg tool "$tool" \
            --arg arch "$arch_bin" \
            '$tool + "-" + .name + "::" + (.assets[] | select(.name == $tool + "-linux-" + $arch) | .url)' \
            <"${tmp_file}" \
            >>"${basedir}/_source_${arch_pkg}"

        jq --raw-output '.body' <"${tmp_file}" \
            | rg -F "linux-${arch_bin}" \
            | awk '{print $1}' \
            >>"${basedir}/_hashsum_${arch_pkg}"
    done
done

for arch_pkg in "${arches_pkg[@]}"; do
    cat <<EOF >>"${tmp_pkgbuild}"
source_${arch_pkg}=(
$(cat "${basedir}/_source_${arch_pkg}")
)
sha256sums_${arch_pkg}=(
$(cat "${basedir}/_hashsum_${arch_pkg}")
)
EOF
done

{
    echo "package() {"

    for tool in "${tools[@]}"; do
        bin_name=$(rg "^${tool}[^:]+" -o "${basedir}/_source_x86_64")
        # shellcheck disable=SC2016
        echo 'install -Dm 755 "${srcdir}/'"${bin_name}"'" "${pkgdir}/usr/bin/'"${tool}"'"'
    done

    echo "}"
} >>"${tmp_pkgbuild}"

if diff -q <(sed '/^pkgver=/d' "${tmp_pkgbuild}") <(sed '/^pkgver=/d' PKGBUILD) >/dev/null; then
    echo "⚠️ No changes detected"
else
    mv "${tmp_pkgbuild}" PKGBUILD
fi
