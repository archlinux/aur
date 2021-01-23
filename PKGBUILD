# Maintainer: Sabu Siyad <ssiyad at disroot dot org>

pkgname=hopp-cli-bin
_pkgname=hopp-cli
pkgver=0.0.7
pkgrel=1
pkgdesc="HTTP client like cURL / HTTPie and a CLI client for https://hoppscotch.io"
arch=('x86_64')
url="https://github.com/hoppscotch/hopp-cli"
license=("MIT")
provides=("hopp-cli")
source=(
    "https://github.com/hoppscotch/hopp-cli/releases/download/v${pkgver}/hopp-cli_${pkgver}_Linux_x86_64.tar.gz"
)
sha256sums=("4b187b083ac6cb159f7725b9d254e4f915ec7de512dbfde5e11688bbf37d3622")

package() {
    cd "${srcdir}"
    install -D "${_pkgname}" "${pkgdir}/usr/local/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
