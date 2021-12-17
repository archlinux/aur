# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=pdfrrr
pkgver=1.1.1
pkgrel=1
pkgdesc='Rotate pdf pages automatically'
provides=(pdfrrr)
depends=(pdftk poppler sed tesseract)
arch=(any)
url='https://github.com/zebradil/pdfrrr'
license=('MIT')

source=(pdfrrr)
sha256sums=('eeede3ef537ce8b9a41c755180dd1fc9d72bb5a3759033541cb8b50e46a2ec77')

package() {
    install -Dm755 "${srcdir}/pdfrrr" "${pkgdir}/usr/bin/pdfrrr"
}
