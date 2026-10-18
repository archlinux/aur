pkgname=linver-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="winver, but for Linux (prebuilt binary)"
arch=('x86_64')
url="https://github.com/itsflameee/linver"
license=('GPL-3.0-or-later')
depends=('qt6-base')
provides=('linver')
conflicts=('linver')
source=("$pkgname-$pkgver::$url/releases/download/v$pkgver/linver")
sha256sums=('f50cd11d8ecf513efbb40b01527ef3382027718c0785b9ccc12d66adfabd3455')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/linver"
}
