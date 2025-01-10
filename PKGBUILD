# Maintainer: rern <rernrern@gmail.com>

pkgname=python-rpi-gpio
pkgver=0.7.1
pkgrel=3
pkgdesc="A Python module to control the GPIO on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python"
license=(MIT)
arch=(x86_64 armv6h armv7h aarch64)
depends=(python)
makedepends=(python python-distribute)
source=(https://files.pythonhosted.org/packages/c4/0f/10b524a12b3445af1c607c27b2f5ed122ef55756e29942900e5c950735f2/RPi.GPIO-$pkgver.tar.gz)
sha256sums=('cd61c4b03c37b62bba4a5acfea9862749c33c618e0295e7e90aa4713fb373b70')

package() {
	cd $srcdir/RPi.GPIO-$pkgver
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
}
