# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrpdf
pkgver=0.7.0
pkgrel=1
pkgdesc="OCR a PDF file and make it browsable"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('pythonmagick' 'python-pillow' 'python-tesserwrap')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
install='ocrpdf.install'
md5sums=("012a62128105318440252f51ab3ac48a")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrpdf "$pkgdir/usr/bin/ocrpdf"
}
