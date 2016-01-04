# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Development version of ocrdesktop"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-tesserwrap' 'tesseract-data-eng')
source=("git+https://github.com/chrys87/ocrdesktop.git")
install='ocrdesktop.install'
provides=('ocrdesktop')
conflicts=('ocrdesktop')
md5sums=("SKIP")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
  install -Dm644 ocrdesktop.1.gz "${pkgdir}/usr/share/man/man1/ocrdesktop.1.gz"
}
