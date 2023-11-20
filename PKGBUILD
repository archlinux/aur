# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=9.21.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('custom:CCO-1.0')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::${_ghurl}/archive/refs/tags/${pkgver}.zip")
sha256sums=('41d414c680e510f81671042292af162279e282643a5f0fea26bf54dacd64f7cc')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}