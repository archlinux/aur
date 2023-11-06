# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simple-icons
pkgver=9.19.1
pkgrel=1
pkgdesc="Free SVG icons for popular brands"
arch=('any')
url="https://simpleicons.org/"
_githuburl="https://github.com/simple-icons/simple-icons"
license=('custom:CCO-1.0')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1ef1e7d0b9cd7176c5d05ab25c7bc0ce55febe2715f7df629b1170c8f6a7521a')
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/icons/"*.svg -t "${pkgdir}/usr/share/icons/${pkgname}/scalable"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}