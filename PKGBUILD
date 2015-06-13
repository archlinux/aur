# Maintainier: FadeMind <fademind@gmail.com>

pkgname=wallpapers-malcer-bundle
pkgver=20150613
pkgrel=1
pkgdesc="Wallpapers designed by Malcer (DE independent)"
arch=('any')
license=('CCPL:by-nc-sa')
url="http://malcer.deviantart.com/gallery/42384526/Wallpapers"
source=("${pkgname}-${pkgver}.tar.lzma::https://copy.com/A2SgZkrUWcgla9TY/${pkgname}-${pkgver}.tar.lzma?download=1")
sha256sums=('dbc40c176d17e43ac8d445e8082bc28fd1e60629ceb86235223a1190f2d10032')
package() {
        cd ${srcdir}
        find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/wallpapers/{}" \;
}  
