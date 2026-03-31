pkgname=postfetch
pkgver=0.2.0
pkgrel=1
pkgdesc="like fastfetch but for security and privacy posture on linux."
arch=('x86_64')
url="https://github.com/R3DRUN3/postfetch"
license=('Unlicense')
depends=()
provides=('postfetch')
conflicts=('postfetch')

source=("$pkgname-$pkgver.tar.gz::https://github.com/R3DRUN3/postfetch/releases/download/v$pkgver/postfetch-v$pkgver-x86_64-linux-musl.tar.gz")
sha256sums=('SKIP')

package() {
  cd "$srcdir"
  bsdtar -xf "$pkgname-$pkgver.tar.gz"
  install -Dm755 postfetch "$pkgdir/usr/bin/postfetch"
}
