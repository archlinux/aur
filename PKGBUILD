# Maintainer: Stephan Brunner <s.brunner@stephan-brunner.net>

pkgname=pdfunlock
pkgver=0.1
pkgrel=2
pkgdesc="Aims to remove modification restrictions from PDF files"
arch=('any')
url="https://github.com/boomer41/PdfUnlock"
license=('MIT')
depends=('ghostscript'
         'poppler'
         'coreutils')
source=("git+http://github.com/boomer41/PdfUnlock.git#tag=v${pkgver}")
makedepends=('git')
md5sums=('SKIP')

package() {
    cd "${srcdir}/PdfUnlock"
    install -Dm755 pdfunlock "${pkgdir}/usr/bin/pdfunlock"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
