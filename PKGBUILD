# Maintainer: wackbyte <wackbyte@protonmail.com>

pkgname=renogare
pkgver=1.0
pkgrel=1
pkgdesc='A clean and elegant sans serif font created by Deepak Dogra'
arch=('any')
license=('custom')
url='https://www.creativefabrica.com/product/renogare/'
makedepends=('unzip')
source=("${pkgname}.zip::https://dl.dafont.com/dl/?f=renogare")
b2sums=('a9213cea82ce34b446a6059b80acdb61a1ef01d0dba42b2df9f6b998b7312e14d211d1d882e81d21686d73590734c9eedcd8ec0c44d387e5964395cceb2fbd39')

prepare() {
    unzip -q -o -j "${pkgname}.zip"
}

package() {
    install -dm755 "${pkgdir}/usr/share/fonts/${pkgname}"
    install -Dm644 Renogare-Regular.otf "${pkgdir}/usr/share/fonts/${pkgname}"

    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 'renogare license.pdf' "${pkgdir}/usr/share/licenses/${pkgname}"
}
