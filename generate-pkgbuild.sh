#!/usr/bin/env bash

set -eo pipefail

readonly basedir=$(mktemp -d)
readonly pkgver=$(date +%Y%m%d)
readonly pkgrel=${PKGBUILD_PKGREL:-1}
readonly tools=(ytt kbld kapp kwt imgpkg vendir)

set -u

cat <<EOF
# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=carvel-tools
pkgdesc="Set of Carvel (k14s) tools: ${tools[@]}"
pkgver=${pkgver}
pkgrel=${pkgrel}
url="https://carvel.dev"
arch=(x86_64)
license=(Apache)
provides=(${tools[@]})
conflicts=(${tools[@]})

EOF

for tool in ${tools[@]};
do
    tmp_file=${basedir}/${tool}
    curl https://api.github.com/repos/vmware-tanzu/carvel-${tool}/releases/latest > ${tmp_file}

    name=$(jq -r '.name' < ${tmp_file})
    url=$(jq -r '.assets[] | select(.name == "'${tool}'-linux-amd64").browser_download_url' < ${tmp_file})
    hashsum=$(jq -r '.body' < ${tmp_file} | rg -F linux-amd64 | awk '{print $1}')

    echo "${tool}-${name}::${url}" >> ${basedir}/_source
    echo ${hashsum} >> ${basedir}/_hashsum
    echo 'install -Dm 755 "${srcdir}/'"${tool}-${name}"'" "${pkgdir}/usr/bin/'${tool}'"' >> ${basedir}/_package
done

cat <<EOF
source=(
$(cat ${basedir}/_source)
)
sha256sums=(
$(cat ${basedir}/_hashsum)
)

package() {
$(cat ${basedir}/_package)
}
EOF
