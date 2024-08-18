# PKGBUILD for encrpter

pkgname=encrpter
pkgver=1.5
pkgrel=1
pkgdesc="A simple file encryption tool"
arch=('any')
url="https://gitlab.com/saydut/encrpter"
license=('GPL3')
depends=('python' 'tk' 'python-cryptography')
source=("encrpter-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/encrpter.py" "$pkgdir/usr/bin/encrpter"
  install -Dm644 "$srcdir/encrpter.desktop" "$pkgdir/usr/share/applications/encrpter.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/encrpter.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
