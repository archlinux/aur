# Maintainer: Devaev Maxim <mdevaev@gmail.com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>


pkgname="python-raspberry-gpio"
pkgver="0.5.11"
pkgrel="1"
pkgdesc="Python library for GPIO access on a Raspberry Pi"
arch=("armv6h" "armv7h")
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=("MIT")
depends=("python")
makedepends=("python-distribute")
source=("https://pypi.python.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz")
md5sums=("9dc3dab6ce2b7ccb833a866efb392821")


package() {
	cd $srcdir/RPi.GPIO-$pkgver
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}
