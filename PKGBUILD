# Maintainer: Chrys <mail@chrys.de>
pkgname=ocrpdf
pkgver=0.2.0
pkgrel=2
pkgdesc="OCR a PDF file and make it browsable"
arch=('any')
url="http://www.crivatec.de"
license=('GPL')
groups=()
depends=('python-pypdf2' 'pythonmagick' 'python-pillow' 'python-tesserwrap')
source=("http://crivatec.de/page/uploads/Downloads/Accessible%20Tools/$pkgname-$pkgver.tar.xz")
install='ocrpdf.install'
md5sums=("1275a555a46ae8dba0011ed24bbb0daf")

package() {
 cd "${srcdir}/"
  install -Dm755 ocrpdf "$pkgdir/usr/bin/ocrpdf"
}
