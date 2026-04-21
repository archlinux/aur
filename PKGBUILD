# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}-bin"
pkgver=0.1.14
pkgrel=1
pkgdesc="Dune Analytics CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/duneanalytics/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)

source_x86_64=("${_pkgname}_${pkgver}_linux_amd64.tar.gz::https://github.com/duneanalytics/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgname}_${pkgver}_linux_arm64.tar.gz::https://github.com/duneanalytics/cli/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('1d7096da3450ab4b64f3d2fc131c3b0d33655ef9809215f8c18e2509ad078b66')
sha256sums_aarch64=('482d1748a10c823c28bde8e6a05f9881a128ff927c000b560c2dd114d6dd4dd4')

package() {
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
