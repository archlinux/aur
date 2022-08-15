# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
arch=("any")
depends=("efibootmgr")
install="efistub-helper.install"
license=("GPL3")
md5sums=("2848c51f6780345190c682e02d4e3a22")
pkgdesc="An easy way to update EFISTUB configuration"
pkgname="efistub-helper"
pkgrel=1
pkgver=1.3
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
