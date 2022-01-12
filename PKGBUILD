# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=3.0
pkgrel=1
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://linux-a11y.org"
license=('GPL3')
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-webcolors' 'python-scipy' 'python-pytesseract' 'tesseract-data-eng')
source=("https://github.com/chrys87/ocrdesktop/archive/refs/tags/v$pkgver.tar.gz")
install='ocrdesktop.install'
provides=('ocrdesktop')
conflicts=('ocrdesktop-git')
md5sums=("52bb16d1b65c8a84e6728e4aa3187be4")

package() {
 cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
  install -Dm644 ocrdesktop.1.gz "${pkgdir}/usr/share/man/man1/ocrdesktop.1.gz"
}
