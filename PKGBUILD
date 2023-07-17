# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=9.6.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_githuburl="https://github.com/simple-icons/simple-icons"
license=('CCO-1.0')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b778d8040a86bb8f84a06bfffd001788f61182f832b064531077140a4cd95449')
package() {
    install -Dm755 -d "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    cp -r "${srcdir}/${pkgname}-${pkgver}/icons/"* "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}