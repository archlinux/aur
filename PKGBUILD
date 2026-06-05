# Maintainer: rumyp <chief@rumyp.org>
pkgname=revreader
pkgver=1.0.1
pkgrel=1
pkgdesc="Minimal Python EPUB reader (terminal + Qt GUI)"
arch=('x86_64')
url="https://github.com/Rumyp/revreader"
license=('MIT')
depends=('python' 'python-pyqt6')
source=("https://github.com/Rumyp/revreader/archive/refs/tags/v1.0.1.tar.gz")
sha256sums=('0e8c7d82aa0b764b54aa9e797c16497a5a3e3ef41773719b2ade61813e96ab87')

package() {
  cd "$srcdir/revreader-1.0" || return
  install -Dm755 revreader.py "$pkgdir/usr/bin/revreader"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

