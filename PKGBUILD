# Maintainer: Sabu Siyad <ssiyad at disroot dot org>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=hopp-cli-bin
_pkgname=hopp-cli
pkgver=0.0.8
pkgrel=1
pkgdesc="HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io"
arch=('x86_64')
url="https://github.com/hoppscotch/hopp-cli"
license=("MIT")
provides=("hopp-cli")
source=(
    "https://github.com/hoppscotch/hopp-cli/releases/download/v${pkgver}/hopp-cli_${pkgver}_Linux_x86_64.tar.gz"
)
sha256sums=("73fe8bf58fc5f9483ac937858c27b38ebd056ce6febb3bd9ea9c9b75e64a0ee1")

package() {
    cd "${srcdir}"
    install -D "${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
