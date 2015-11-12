#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.3
pkgrel=1
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="https://github.com/cortesi/devd"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('ffd73dc0bab1a06af0aa1adc540a3969')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

