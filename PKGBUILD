# Maintainer : catskillmarina <catskillmarina @ gmail.com>

pkgname=grdc-20031019
pkgver=1.0
pkgrel=1
pkgdesc='Great Digital Clock'
arch=('i686' 'x86_64')
url="ftp://ftp.netbsd.org//pub/pkgsrc/distfiles/grdc-20031019.tar.gz"
license=('unknown')
depends=('ncurses' 'gzip')
source=("ftp://ftp.netbsd.org//pub/pkgsrc/distfiles/$pkgname.tar.gz")
md5sums=('409cdcf13edd6931c42878bd8cc9aaf2')

prepare() {
  cd "$pkgname"
  pwd
}

build(){
  cd "$pkgname"
  make
  pwd
}
  
package() {
  cd "$pkgname"
  pwd
  install -Dm755 grdc "$pkgdir/usr/bin/grdc"
  install -Dm644 grdc.6 "$pkgdir/usr/share/man/man6/grdc.6"
}

