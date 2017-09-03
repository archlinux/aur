# Maintainer: Devaev Maxim <mdevaev@gmail.com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>


pkgname="python-raspberry-gpio"
pkgver="0.6.3"
pkgrel="1"
pkgdesc="Python library for GPIO access on a Raspberry Pi"
arch=("armv6h" "armv7h" "aarch64")
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=("MIT")
depends=("python")
makedepends=("python-distribute")
source=("https://files.pythonhosted.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz")
md5sums=("e4abe1cfb5eacebe53078032256eb837")


package() {
	cd $srcdir/RPi.GPIO-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
