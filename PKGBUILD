pkgname=crazyflie-udev
pkgver=0.1
pkgrel=1
pkgdesc="udev rules for Crazyflie by bitcraze."
arch=('any')
url="https://github.com/bitcraze/crazyflie-lib-python#setting-udev-permissions"
license=('MIT')
source=('99-crazyflie.rules')
sha256sums=('3972f8e1106f701c72ae04c3ed449d97c96b729b90bab60b2ec8337db0a7a4db')

package() {
    rulesdir="$pkgdir/etc/udev/rules.d/"
    mkdir -p $rulesdir
    cp "99-crazyflie.rules" $rulesdir
}
