# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=jail
pkgver=1.0
pkgrel=1
pkgdesc="a simple program to lock mouse in a defined area"
url="http://gentoo-en.vfose.ru/wiki/X.Org/Dual_Monitors/Mouse_Control"
license=("GPL2")
arch=('any')
depends=('libxtst')
source=(https://dl.dropboxusercontent.com/u/29095940/oss/Jail.tar.gz)
md5sums=('75fde6ec50a8e00c8adc5f9d59a5b286')
build() {
  cd $srcdir
  make
}

package() {
  install -Dm755 $srcdir/Jail $pkgdir/usr/bin/Jail
}
