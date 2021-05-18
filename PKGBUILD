# Maintainer: André Kugland <kugland at gmail dot com>

pkgname=nojail
pkgver=1.0.0
pkgrel=1
pkgdesc="Script to execute binaries outside firejail"
arch=(any)
url="https://github.com/kugland/$pkgname"
license=('MIT')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12b2f40d15671f089cf7162230acd355a8972aa584b6c2ade8a4236a3d02c211')

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -m 755 -o 0 -g 0 -D -t $pkgdir/usr/bin/ nojail
  install -m 644 -o 0 -g 0 -D -t $pkgdir/usr/share/doc/nojail README.md LICENSE
}
