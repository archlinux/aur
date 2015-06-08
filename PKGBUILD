# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrdesktop
pkgver=0.9.28
pkgrel=1
pkgdesc="OCR the current window or desktop and make it browsable for the user"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('libwnck3' 'orca' 'python-pillow' 'python-tesserwrap')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Games/$pkgname-$pkgver.tar.xz")
install='ocrdesktop.install'
md5sums=("b699a43edcb4f5db00fd22f104bc2659")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrdesktop "$pkgdir/usr/bin/ocrdesktop"
}
