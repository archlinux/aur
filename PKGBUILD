# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-setproctitle
pkgver=1.1.3
pkgrel=1
pkgdesc="Allows a python process to change its process title"
license=("BSD")
url="http://code.google.com/p/py-setproctitle/"
depends=('python')
source=(http://pypi.python.org/packages/source/s/setproctitle/setproctitle-$pkgver.tar.gz)
arch=('i686' 'x86_64')
options=(!emptydirs)

build() {
	cd "$srcdir/setproctitle-$pkgver"
	[ -d build ] && rm -rf build
	python setup.py install --root="$pkgdir"
}

md5sums=('64028521850dc68c5b90d45377de3f5c')
