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
sha256sums=('18eedd86dd28844ac109193a623ccf0d17fbf45f3b8f3ba61fa83a8bd10ab605')

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || return
  install -Dm755 revreader.py "$pkgdir/usr/bin/revreader"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

