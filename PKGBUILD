# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-couleur
pkgver=0.2
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python2')
arch=('any')
source=(http://pypi.python.org/packages/source/c/couleur/couleur-$pkgver.tar.gz)
md5sums=('455d3ac3fa7f2408d4f1372860498203')

build() {
	cd "$srcdir"
	python2 setup.py install --root="$pkgdir"
}

