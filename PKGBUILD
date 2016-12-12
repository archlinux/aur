#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.7
pkgrel=1
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="https://github.com/cortesi/devd"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('0e31c471f8628fa9cc2b3aa198b724bf')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

