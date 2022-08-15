# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
arch=("any")
depends=("efibootmgr")
install="efistub-helper.install"
license=("GPL3")
md5sums=("e3620140cdb49529b3cdf87f33a107e6")
pkgdesc="An easy way to update EFISTUB configuration"
pkgname="efistub-helper"
pkgrel=2
pkgver=1.2
source=("update-efistub")
url="https://github.com/misaka19465/EFISTUBHelper"

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/efistub.d
  touch $pkgdir/etc/efistub.conf
  install -m755 $srcdir/update-efistub $pkgdir/usr/bin/update-efistub
}
