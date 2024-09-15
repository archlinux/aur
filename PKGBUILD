# Maintainer: wackbyte <wackbyte@protonmail.com>

pkgname=ttf-renogare-soft
pkgver=1.0
pkgrel=1
pkgdesc='A clean and elegant sans serif font created by Deepak Dogra'
arch=('any')
license=('custom')
url='https://www.creativefabrica.com/product/renogare-soft/'
makedepends=('unzip')
source=("${pkgname}.zip::https://dl.dafont.com/dl/?f=renogare_soft")
b2sums=('f76df600cb59d2103fe1970c6ebece1053ba41131f5c957d92ae5b0d43844a93ba9f30f388dd154602af7c51c0076a8567776575a6e3d2bcffe973d3a7e56d93')

prepare() {
    unzip -q -o -j "${pkgname}.zip"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 RenogareSoft-Regular.ttf "${pkgdir}/usr/share/fonts/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 'renogare soft license.pdf' "${pkgdir}/usr/share/licenses/${pkgname}"
}
