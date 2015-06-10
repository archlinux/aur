# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>

pkgname=optimize-git
pkgver=0.2
pkgrel=1
pkgdesc='Script for tweaking the system for better desktop performance'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/optimize'
license=('MIT')
depends=('setconf')
makedepends=('git')
source=("$pkgname::git://github.com/xyproto/optimize.git#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname"
  install -Dm755 optimize.sh "$pkgdir/usr/bin/optimize"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
