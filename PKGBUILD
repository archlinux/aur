# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=1.01
pkgrel=1
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://www.crivatec.de"
license=('GPL3')
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-tesserwrap' 'tesseract-data-eng')
source=("https://github.com/chrys87/ocrdesktop/archive/$pkgver.tar.gz")
install='ocrdesktop.install'
provides=('ocrdesktop')
conflicts=('ocrdesktop-git')
md5sums=("c48f6005b89b7d8be6265164fd434f5b")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
  install -Dm644 ocrdesktop.1.gz "${pkgdir}/usr/share/man/man1/ocrdesktop.1.gz"
}
