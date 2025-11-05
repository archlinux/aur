pkgname=hostman
pkgver=1.1.5
pkgrel=1
pkgdesc="A simple file host manager for various image hosting services"
arch=('x86_64')
url="https://github.com/keircn/hostman"
license=('MIT')
depends=('curl' 'sqlite' 'openssl' 'cjson')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  install -Dm755 hostman "$pkgdir/usr/bin/hostman"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 CHANGELOG.md "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
