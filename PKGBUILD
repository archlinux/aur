# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-couleur
pkgver=0.7.4
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python-setuptools')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/c/couleur/couleur-$pkgver.tar.gz")
sha256sums=('1e96a5972ecd5f88716fe4e4df63d31e85f57d3ff6c02a07e93a226a663961ba')

build() {
	cd "$srcdir/couleur-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/couleur-$pkgver"
	python setup.py install --skip-build -O1 --root="$pkgdir"
}
