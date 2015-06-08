# Maintainier: FadeMind <fademind@gmail.com>

pkgname=wallpapers-malcer-bundle
pkgver=20150411
pkgrel=1
pkgdesc="Wallpapers designed by Malcer (DE independent)"
arch=('any')
license=('CCPL:by-nc-sa')
url="http://malcer.deviantart.com/gallery/42384526/Wallpapers"
conflicts=('caledonia-bundle')
source=("${pkgname}.tar.xz::https://copy.com/waPpXYdhhoNZUWdi/${pkgname}.tar.xz?download=1")
sha256sums=('9be745f6d4b8bbe72fbffb7bd80309e1d75c620a03c00e92578219f6f28b407a')
package() {
        cd ${srcdir}/${pkgname}
        find * -type f -exec install -Dm 644 '{}' "${pkgdir}/usr/share/wallpapers/{}" \;
}  
