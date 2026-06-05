# Maintainer: rumyp <chief@rumyp.org>
pkgname=revreader
pkgver=1.0.3
pkgrel=1
pkgdesc="Minimal Python EPUB reader (terminal + Qt GUI)"
arch=('x86_64')
url="https://github.com/Rumyp/revreader"
license=('MIT')
depends=('python' 'python-pyqt6')
source=("https://github.com/Rumyp/revreader/archive/refs/tags/v1.0.3.tar.gz")
sha256sums=('a8296c456953a7e1d21f1b54c7cf4d99c2f8cdcd799242be173c3b78d4570b42')

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || return
  install -Dm755 revreader.py "$pkgdir/usr/bin/revreader"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

