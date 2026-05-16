# Maintainer: atiar9999
pkgname=pdf-annotator
pkgver=1.0.0
pkgrel=1
pkgdesc="An application to annotate PDF files."
arch=('any')
url="https://github.com/Mutacim-Billah-Tacin/pdf-annotator"
license=('MIT')
depends=('python' 'python-pymupdf' 'python-pyqt6')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b72953280c77f4b18af7cb9bd2c2e05118c9031b3f65e97aeb331bb25c04647')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/pdf-annotator"
}
