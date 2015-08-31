# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
pkgname=mkinitcpio-liveusb-units
pkgver=1
pkgrel=2
pkgdesc="mkinitcpio minimal block hooks for live usb sticks"
arch=('any')
license=('GPLv3')
url=('http://archlinux.org')
depends=('mkinitcpio>=0.12')
source=('live_usb' 'live_mmc' 'live_firewire')
md5sums=('fe23d065b1232be3e73ae94b3e619acf'
         'b3bd45266897d51e43e4e747793e54b4'
         '47331e58b269d9a6b955fcfbc3855f89')
sha1sums=('1c925edb76ed9ed0b6c9949e7589757b5bab17c5'
          'c28c3a42d34762adf799dcea69aa484f86b2781e'
          '3178105ed08fe5b76b6d93006d5fab7117c48df5')

package() {
  install -dm755 "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/live_firewire" "${pkgdir}/usr/lib/initcpio/install/live_firewire"
  install -m644 "${srcdir}/live_usb" "${pkgdir}/usr/lib/initcpio/install/live_usb"
  install -m644 "${srcdir}/live_mmc" "${pkgdir}/usr/lib/initcpio/install/live_mmc"
}

