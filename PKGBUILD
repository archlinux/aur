# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=10.1.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('custom:CCO-1.0')
conflicts=("${pkgname}")
makedepends=(
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=${pkgver}"
)
sha256sums=('SKIP')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}