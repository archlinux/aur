# Maintainer: taxin
pkgname=pdf-annotator
pkgver=1.0.2
pkgrel=1
pkgdesc="An application to annotate PDF files."
arch=('any')
url="https://github.com/Mutacim-Billah-Tacin/pdf-annotator"
license=('MIT')
depends=('python' 'python-pymupdf' 'python-pyqt6')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('be4a3c1b5da514e92f6ca5cb215f1810235795655abf16fc53f7c27e248816a0')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 main.py "$pkgdir/usr/bin/pdf-annotator"
    install -Dm644 pdf-annotator.desktop "$pkgdir/usr/share/applications/pdf-annotator.desktop"
    install -Dm644 pdf-annotator.png "$pkgdir/usr/share/pixmaps/pdf-annotator.png"
}
