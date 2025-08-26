# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=huawei-e3372h-udev
pkgver=1
pkgrel=1
pkgdesc="Udev rule for the Huawei E3372h modem"
arch=('any')
depends=('usb_modeswitch')
source=("15-huawei-e3372h.rules")
sha256sums=('8e496d5df77f51c7ebe2eb1771c323384dce00df59f77ba5a9fa2aacb72bee49')

package(){
  install -Dm644 15-huawei-e3372h.rules -t "$pkgdir/etc/udev/rules.d"
}
