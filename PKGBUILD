# Maintainer: taxin
pkgname=pdf-annotator
pkgver=1.0.1
pkgrel=1
pkgdesc="An application to annotate PDF files."
arch=('any')
url="https://github.com/Mutacim-Billah-Tacin/pdf-annotator"
license=('MIT')
depends=('python' 'python-pymupdf' 'python-pyqt6')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b114c34db28ae07e646ef238f29bbfaeb44c85b2e429fde54d800b4361f5dec4')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/pdf-annotator"
    install -Dm644 pdf-annotator.desktop "$pkgdir/usr/share/applications/pdf-annotator.desktop"
    install -Dm644 pdf-annotator.png "$pkgdir/usr/share/pixmaps/pdf-annotator.png"
}
