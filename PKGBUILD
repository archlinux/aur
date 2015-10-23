#Maintainer: Nick Boughton <nicholasboughton@gmail.com>
pkgname=devd
pkgver=0.1
pkgrel=2
pkgdesc="devd: a web daemon for developers"
arch=('x86_64')
url="http://corte.si/posts/devd/intro/index.html"
license=('MIT')
provides=('devd')
source=("https://github.com/cortesi/devd/releases/download/v$pkgver/$pkgname-$pkgver-linux64.tgz")
md5sums=('86b02d2b2fa79608726a8aac913677f9')

package() {
  cd "$pkgname-$pkgver-linux64"
  mkdir -p $pkgdir/usr/bin
  cp devd $pkgdir/usr/bin/
}

