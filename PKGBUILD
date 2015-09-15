# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=0.9.95
pkgrel=1
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('libwnck3' 'python-atspi' 'python-pillow' 'python-tesserwrap')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
install='ocrdesktop.install'
md5sums=("1f827f064b3b8f3340280d9ee546180b")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
}
