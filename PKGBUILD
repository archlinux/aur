# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.2
pkgrel=1
pkgdesc='Finetune write cache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
source=('99-usb-sync.rules')
sha256sums=('d6cb851a9be886a5f36414e872e3176983fbc5aa428af41a07f5b54bfb53d764')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    cp ${startdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
}
