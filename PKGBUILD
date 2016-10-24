# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_bbio-git
pkgver='1.0.0.r13.gd1e8dc1'
pkgver() {
  cd adafruit-beaglebone-io-python
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
pkgrel=1
pkgdesc="Adafruit's BeagleBone IO Python Library" 
url="https://github.com/adafruit/adafruit-beaglebone-io-python"
arch=('x86_64' 'armv7h')
license=('GPLv3')
depends=('python')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=("git://github.com/adafruit/adafruit-beaglebone-io-python")
md5sums=('SKIP')

package() {
  cd "${srcdir}/adafruit-beaglebone-io-python"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
