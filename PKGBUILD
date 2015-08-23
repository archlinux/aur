# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-adafruit_bbio-git
pkgver=0.0.30
pkgrel=1
pkgdesc="Python adafruit library for using GPIO of the beaglebone 
boards"
url="https://github.com/adafruit/adafruit-beaglebone-io-python"
arch=('armv7h')
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
