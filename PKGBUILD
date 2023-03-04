# Maintainer: 
pkgname='udev-usb-sync'
pkgver=0.1
pkgrel=1
pkgdesc='Disable writecache when USB storage device is plugged'
arch=('any')
url='https://codeberg.org/wonky/udev-usb-sync'
license=('MIT')
depends=('hdparm')
provides=("${pkgname}")
source=('99-usb-sync.rules')
sha256sums=('ed0253bbbd5b64529efd752978ba17176e3ff23d3f7f220bbacd3fa3a3691df9')

package() {
    install -d -m755 $pkgdir/etc/udev/rules.d
    cp ${startdir}/99-usb-sync.rules "${pkgdir}/etc/udev/rules.d"
}
