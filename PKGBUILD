#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.8
pkgrel=1
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="https://github.com/cortesi/devd"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('639f5bf28055c9970346dee36b90f768')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

