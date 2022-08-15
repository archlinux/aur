# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
pkgname="efistub-helper"
pkgdesc="An easy way to update EFISTUB configuration"
url="https://github.com/misaka19465/EFISTUBHelper"
pkgver=1.0
pkgrel=4
arch=("any")
license=("GPL3")
depends=("efibootmgr")
source=("update-efistub" "efistub-helper.install")
md5sums=("ce9c583a784bc4a738c491acab885ded" "900cfc77498c67aee330e2c094754dd4")
install="efistub-helper.install"

package() {
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/efistub.d
  touch $pkgdir/etc/efistub.conf
  install -m755 $srcdir/update-efistub $pkgdir/usr/bin/update-efistub
}
