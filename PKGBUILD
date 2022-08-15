# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
arch=("any")
depends=("efibootmgr")
install="efistub-helper.install"
license=("GPL3")
md5sums=("2848c51f6780345190c682e02d4e3a22" "a836f8af2d62076ba3791992cd358693")
pkgdesc="An easy way to update EFISTUB configuration"
pkgname="efistub-helper"
pkgrel=3
pkgver=1.3
source=("update-efistub" "update-efistub.hook")
url="https://github.com/misaka19465/EFISTUBHelper"

package() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/etc/efistub.d
  mkdir -p $pkgdir/usr/share/libalpm/hooks
  install -m755 $srcdir/update-efistub $pkgdir/usr/bin/update-efistub
  install -m644 $srcdir/update-efistub.hook $pkgdir/usr/share/libalpm/hooks/update-efistub.hook
}
