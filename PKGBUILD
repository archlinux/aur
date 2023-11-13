# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=9.20.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_githuburl="https://github.com/simple-icons/simple-icons"
license=('custom:CCO-1.0')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.zip::${_githuburl}/archive/refs/tags/${pkgver}.zip")
sha256sums=('324eb58751063af4ee774e0fbdc6054be4588378b8875ebd2a4fa1cf2f5ad417')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}