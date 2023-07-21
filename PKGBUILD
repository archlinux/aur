# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.1
pkgrel=2
pkgdesc='Finetune writecache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
source=('99-usb-sync.rules')
sha256sums=('012b9991a9eee3149eb27e8d3c7b4d40b56bbfe2030ce84823a90c968410f8d0')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    cp ${startdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
}
