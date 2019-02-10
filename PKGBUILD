# Maintainer: Devaev Maxim <mdevaev@gmail.com>
# Contributor: Michael Serpieri <contact at pygoscelis dot org>


pkgname=python-raspberry-gpio
pkgver=0.6.5
pkgrel=1
pkgdesc="Python library for GPIO access on a Raspberry Pi"
url="http://sourceforge.net/projects/raspberry-gpio-python/"
license=(MIT)
arch=(armv6h armv7h aarch64)
depends=(python)
makedepends=(gcc python-distribute)
source=("https://files.pythonhosted.org/packages/source/R/RPi.GPIO/RPi.GPIO-$pkgver.tar.gz")
sha1sums=(b792e7b95e3a169b35ea9010fc8bd3e5d69aa670)


package() {
	cd "$srcdir/RPi.GPIO-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
