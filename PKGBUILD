pkgname=crazyflie-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Crazyflie by bitcraze."
arch=('any')
url="https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions"
license=('MIT')
source=('99-crazyflie.rules')
sha256sums=('e3efe6e408ff89228a987f534f5909014680ad2d0a553b18326438cc509431c1')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-crazyflie.rules" $rulesdir
}
