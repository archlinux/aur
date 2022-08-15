# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
pkgname="efistub-helper"
pkgdesc="An easy way to update EFISTUB configuration"
url="https://github.com/misaka19465/EFISTUBHelper"
pkgver=1.2
pkgrel=1
arch=("any")
license=("GPL3")
depends=("efibootmgr")
source=("update-efistub")
md5sums=("e3620140cdb49529b3cdf87f33a107e6")
install="efistub-helper.install"

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/efistub.d
  touch $pkgdir/etc/efistub.conf
  install -m755 $srcdir/update-efistub $pkgdir/usr/bin/update-efistub
}
