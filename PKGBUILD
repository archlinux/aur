# Maintainer: GI_Jack <iGI_Jack@hackermail.com>
pkgname=mkinitcpio-liveusb-units
pkgver=1
pkgrel=3
pkgdesc="mkinitcpio minimal block hooks for live usb sticks"
arch=('any')
license=('GPLv3')
url='http://archlinux.org'
depends=('mkinitcpio>=0.12')
source=('live_usb' 'live_mmc' 'live_firewire')
sha256sums=('9a3e21cf18cdcec6e9e7e63ea3037d4914900916dbd8c7106a8ac7208d036d2c'
            '2d7f49c80b4230a62adf004a24187cc6aeac75788c70761a178b9ae4ca6fc978'
            '4a681d345e55303fc7a9669d644c4dffc9fcad46a2a6dd98075ed281a28662e4')

package() {
  install -dm755 "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/live_firewire" "${pkgdir}/usr/lib/initcpio/install/live_firewire"
  install -m644 "${srcdir}/live_usb" "${pkgdir}/usr/lib/initcpio/install/live_usb"
  install -m644 "${srcdir}/live_mmc" "${pkgdir}/usr/lib/initcpio/install/live_mmc"
}

