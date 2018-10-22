pkgname=crazyradio-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Crazyradio by bitcraze."
arch=('any')
url="https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions"
license=('MIT')
source=('99-crazyradio.rules')
sha256sums=('549f2cdf2a776937e41f779d958eb00929a6a3ecc019af555e6433a383becd00')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-crazyradio.rules" $rulesdir
}
