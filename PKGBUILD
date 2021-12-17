# Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=pdfrrr
pkgver=1.1.0
pkgrel=1
pkgdesc='Rotate pdf pages automatically'
provides=(pdfrrr)
depends=(pdftk poppler sed tesseract)
arch=(any)
url='https://github.com/zebradil/pdfrrr'
license=('MIT')

source=(pdfrrr)
sha256sums=('afdfadfc679efd4289f8f95cdb6b1d5250f3d4b6a5e2730159611c224d34b472')

package() {
    install -Dm755 "${srcdir}/pdfrrr" "${pkgdir}/usr/bin/pdfrrr"
}
