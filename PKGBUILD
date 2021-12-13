# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=pdfrrr
pkgver=1.0.0
pkgrel=1
pkgdesc='Rotate pdf pages automatically'
provides=(pdfrrr)
depends=(pdftk poppler sed tesseract)
arch=(any)
url='https://github.com/zebradil/pdfrrr'
license=('MIT')

source=(pdfrrr)
sha256sums=('4e65f313bd2a9b0e22c6215b8757661e0479a61acb8a31ba8a5c8a05ab6c29b3')

package() {
    install -Dm755 "${srcdir}/pdfrrr" "${pkgdir}/usr/bin/pdfrrr"
}
