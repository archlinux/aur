# Maintainer: GI_Jack <GI_Jack@hackermail.com>
pkgname=mkinitcpio-liveusb-units
pkgver=3
pkgrel=1
pkgdesc="mkinitcpio minimal block hooks for live usb sticks"
arch=('any')
license=('GPLv3')
url='http://archlinux.org'
depends=('mkinitcpio>=0.12')
source=('live_usb' 'live_mmc' 'live_firewire' 'live_virtual')
sha256sums=('3f559343cb070ccb77f03fcf54cc2f6a85b763909173dedd2c0aef3394adc7ee'
            '5b4d182584adfc6ec65c9e5c93cf5fff999de08550e3e4ce1483a2e3699bff7c'
            'f749ed0ce887f0f59f03c451c5eaa381168c59f389beca8b745fb103c8b13248'
            'db0fe129ab73b7be995d4298be4ae318772f7b2ee719bd0c35ec89373cd6f102')

package() {
  install -dm755 "${pkgdir}/usr/lib/initcpio/install"
  install -m644 "${srcdir}/live_firewire" "${pkgdir}/usr/lib/initcpio/install/live_firewire"
  install -m644 "${srcdir}/live_usb" "${pkgdir}/usr/lib/initcpio/install/live_usb"
  install -m644 "${srcdir}/live_mmc" "${pkgdir}/usr/lib/initcpio/install/live_mmc"
  install -m644 "${srcdir}/live_virtual" "${pkgdir}/usr/lib/initcpio/install/live_virtual"
}

