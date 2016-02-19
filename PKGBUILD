#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.4
pkgrel=2
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="https://github.com/cortesi/devd"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('33627c06429712282106498fc9a8faed')

package() {
  cd "tmp/$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

