# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-couleur
pkgver=0.6.1
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python2-setuptools')
arch=('any')
source=("https://pypi.python.org/packages/source/c/couleur/couleur-$pkgver.tar.gz")

build() {
	cd "$srcdir/couleur-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/couleur-$pkgver"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('6bc07462df223fbf6bfc6fa7106da633fcd7acf895a7003676126c7b347491c8')
