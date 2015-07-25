pkgname=usbasp-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for USBasp Atmel AVR programmer."
arch=('any')
url="http://www.fischl.de/usbasp/"
license=('MIT')
source=('99-usbasp.rules')
sha256sums=('8d4b15c72978c73242f90a02cc921219bb90b76470be3234b05b4523b1abde6c')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-usbasp.rules" $rulesdir
}
