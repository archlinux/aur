# Maintainer: Adel Khial <adel.khial@gmail.com>
pkgname=ttf-cairo
pkgver=1.0
pkgrel=1
pkgdesc="Cairo is a contemporary Arabic and Latin typeface family."
arch=(any)
url=https://fonts.google.com/specimen/Cairo
license=(custom:OFL)
source=("Cairo.zip::https://fonts.google.com/download?family=Cairo")
md5sums=('46be687189b62b8a41121720ceaa87e2')

package () {
        install -Dm644 -t "${pkgdir}/usr/share/fonts/${pkgname}" "${srcdir}"/*.ttf
        install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}"/OFL.txt
}

