#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.2
pkgrel=2
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="https://github.com/cortesi/devd"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('02e9c78f51d166b9b0528f78b51da786')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

