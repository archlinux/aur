# Maintainer: rumyp <chief@rumyp.org>
pkgname=revreader
pkgver=1.0.2
pkgrel=1
pkgdesc="Minimal Python EPUB reader (terminal + Qt GUI)"
arch=('x86_64')
url="https://github.com/Rumyp/revreader"
license=('MIT')
depends=('python' 'python-pyqt6')
source=("https://github.com/Rumyp/revreader/archive/refs/tags/v1.0.2.tar.gz")
sha256sums=('6fd5d4cf0293e631946f711c2e4b3c90f819e5b3ea34ed32ed4a07cf400b075a')

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || return
  install -Dm755 revreader.py "$pkgdir/usr/bin/revreader"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

