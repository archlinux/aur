# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=16.33.0
pkgrel=1
pkgdesc="Free SVG icons for popular brands."
arch=('any')
url="https://simpleicons.org/"
_ghurl="https://github.com/simple-icons/simple-icons"
license=('CC0-1.0')
conflicts=("${pkgname}")
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7b738cdfb6e155c734b55dc3060de5579cf299c71b12852b753318066421e51d')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
