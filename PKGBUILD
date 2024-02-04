# Maintainer: Ricardo Band <email@ricardo.band>
# Maintainer: coon <coon@mailbox.org>

pkgname=sanic
pkgdesc="chaos music control"
pkgver=0.0.1
pkgrel=1
arch=("any")
license=("MIT")
url="https://git.berlin.ccc.de/cccb/sanic"
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://git.berlin.ccc.de/cccb/sanic/src/tag/v$pkgver.tar.gz")
sha256sums=('foo')

build() {
  cd $pkgname-$pkgver
  go build .
}

package() {
  install -Dm 755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
