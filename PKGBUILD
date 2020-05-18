# Maintainer: aur ät dbrgn döt ch
pkgname=crazyradio-udev
pkgver=0.2
pkgrel=1
pkgdesc="udev rules for Crazyradio by bitcraze."
arch=('any')
url="https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions"
license=('GPL')
source=('99-crazyradio.rules')
sha256sums=('dab14a954ac7f1fb0d943efb55098fcd10bd6c023263bafb8cf1fafc2749f45e')

package() {
    mkdir -p "$pkgdir/etc/udev/rules.d/"
    cp "99-crazyradio.rules" "$pkgdir/etc/udev/rules.d/"
}
