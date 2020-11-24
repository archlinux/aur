# Maintainer: wackbyte <wackbyte@pm.me>

pkgname=renogare
pkgver=1.0
pkgrel=1
pkgdesc="A clean and elegant sans serif font created by Deepak Dogra"
arch=(any)
license=(custom)
url=https://www.creativefabrica.com/product/renogare/
makedepends=(unzip)
source=("$pkgname.zip::https://dl.dafont.com/dl/?f=renogare")
sha512sums=('983c2d1c3aa35a50aaab613f47ae1023d050e9f75adecdb94366e4461ef7254ad745b4e7fad7c664e598c5315c4b3f58118350b5faaa1f475265c81894e73cac')

prepare() {
    unzip -q -o -j $pkgname.zip
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 "Renogare-Regular.otf" "${pkgdir}/usr/share/fonts/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "renogare license.pdf" "${pkgdir}/usr/share/licenses/${pkgname}"
}