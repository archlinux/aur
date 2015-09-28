# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=0.9.97
pkgrel=1
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-tesserwrap' 'tesseract-data-eng')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
install='ocrdesktop.install'
md5sums=("fdad271ff8a440f96f9985d90f9d3379")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
  cp ocrdesktop.1.gz "${pkgdir}/usr/share/man/man1/ocrdesktop.1.gz"
}
