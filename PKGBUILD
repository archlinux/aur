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
sha256sums=('35737a444009e1f25e50a584f9fb4a921cff871354d356c43ce1157f974bb2a0')

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || return
  install -Dm755 revreader.py "$pkgdir/usr/bin/revreader"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

