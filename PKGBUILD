# Maintainer: wackbyte <im@purring.fyi>

pkgname=otf-renogare
pkgver=20170428
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
    install -Dm644 -t "${pkgdir}/usr/share/fonts/OTF" Renogare-Regular.otf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'renogare license.pdf'
}
