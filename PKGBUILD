# Maintainer: Damian Höster <damian.hoester@posteo.de>

pkgname=ansi
pkgver=3.0.1
pkgrel=1
pkgdesc='ANSI escape codes in pure bash - change text color, position cursor, and more'
arch=(any)
url=https://github.com/fidian/ansi
license=(LicenseRef-MIT-advertising)
depends=(bash)
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=(8dae1314d98a015d4d64fd2a99895700138756f2b456baea7cf1d6dd3ccf1261)

package() {
  cd $pkgname-$pkgver

  install -Dm755 $pkgname -t "$pkgdir"/usr/bin
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
}
