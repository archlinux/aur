# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=0.9.96
pkgrel=2
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-tesserwrap' 'tesseract-data-eng')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
install='ocrdesktop.install'
md5sums=("a6cef9222bde1e49becc1b133c0bb190")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
}
