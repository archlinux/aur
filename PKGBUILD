# Maintainer: Devaev Maxim <mdevaev@gmail.com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>


pkgname="python-raspberry-gpio"
pkgver="0.6.2"
pkgrel="1"
pkgdesc="Python library for GPIO access on a Raspberry Pi"
arch=("armv6h" "armv7h")
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=("MIT")
depends=("python")
makedepends=("python-distribute")
source=("https://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz")
md5sums=("9db86fd5f3bae872de9dbb068ee0b096")


package() {
	cd $srcdir/RPi.GPIO-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
