# Maintainer: root.nix.dk
pkgname='udev-usb-sync'
pkgver=0.2
pkgrel=2
pkgdesc='Finetune write cache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
source=('99-usb-sync.rules')
sha256sums=('cc300e97e3ea8b0bf6fa46fa93bef9cc42218676955cb3b7fa7e2706d76cf9db')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    cp ${startdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
}
