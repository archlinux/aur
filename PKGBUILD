# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=guisu
pkgver=0.5
pkgrel=1
pkgdesc='Script for running GUI programs as root, with fallbacks'
arch=('any')
url='https://github.com/xyproto/guisu'
license=('MIT')
depends=('polkit')
source=("$pkgname-$pkgver.tgz::https://github.com/xyproto/$pkgname/archive/master.tar.gz")
sha256sums=('35a811d9f0bd0156606a8b19f631cbc79b1185ddbb6ba1441360282cc9310c46')

package() {
  cd "$pkgname-master"

  install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
