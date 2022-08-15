# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
pkgname="efistub-helper"
pkgdesc="An easy way to update EFISTUB configuration"
url="https://github.com/misaka19465/EFISTUBHelper"
pkgver=1.0
pkgrel=2
arch=("any")
license=("GPL3")
depends=("efibootmgr")
source=("update-efistub" "efistub-helper.install")
md5sums=("ce9c583a784bc4a738c491acab885ded" "3d460cb6523ab14e316ccf449818ae97")

package() {
  mkdir $pkgdir/bin
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/efistub.d
  touch $pkgdir/etc/efistub.conf
  install -m755 $srcdir/update-efistub $pkgdir/bin/update-efistub
}
