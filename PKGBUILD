# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-daemon
pkgver=1.6
pkgrel=1
pkgdesc="Library to implement a well-behaved Unix daemon process"
license=("PSF-2+")
url="http://pypi.python.org/pypi/python-daemon"
depends=('python2-lockfile')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/python-daemon/python-daemon-$pkgver.tar.gz)
arch=('any')
options=(!emptydirs)

build() {
	cd "$srcdir/python-daemon-$pkgver"
	python2 setup.py install --root="$pkgdir"
}

md5sums=('c774eda27d6c5d80b42037826d29e523')
