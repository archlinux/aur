# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=jail
pkgver=1.0
pkgrel=3
pkgdesc="a simple program to lock mouse in a defined area"
url="http://gentoo-en.vfose.ru/wiki/X.Org/Dual_Monitors/Mouse_Control"
license=("GPL2")
arch=('any')
depends=('libxtst')
source=(https://github.com/jose1711/jail/archive/master.zip)
md5sums=('73ed9935f5d753505eb9f18d2cbc461d')

build() {
  cd $srcdir/jail-master
  make
}

package() {
  install -Dm755 $srcdir/jail-master/Jail $pkgdir/usr/bin/Jail
}
