# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=13.2.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('CC0-1.0')
conflicts=("${pkgname}")
makedepends=(
    'git'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz"
)
sha256sums=('1a05bc8aff957ec237887a88801136fb304f05917600840fe7dd7c6f8436d0a2')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}