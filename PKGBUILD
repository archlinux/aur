# Maintainer : catskillmarina <catskillmarina @ gmail.com>

pkgname=grdc
pkgver=20031019
pkgrel=1.2
pkgdesc='Great Digital Clock'
arch=('any')
url="ftp://ftp.netbsd.org//pub/pkgsrc/distfiles/grdc-20031019.tar.gz"
license=('unknown')
depends=('ncurses' 'gzip')
source=("ftp://ftp.netbsd.org//pub/pkgsrc/distfiles/$pkgname-$pkgver.tar.gz")
md5sums=('409cdcf13edd6931c42878bd8cc9aaf2')

prepare() {
  cd "$pkgname-$pkgver"
  pwd
}

build(){
  cd "$pkgname-$pkgver"
  cc -lcurses -o grdc grdc.c
  pwd
}
  
package() {
  cd "$pkgname-$pkgver"
  pwd
  install -Dm755 grdc "$pkgdir/usr/bin/grdc"
  install -Dm644 grdc.6 "$pkgdir/usr/share/man/man6/grdc.6"
}

