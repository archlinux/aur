# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-couleur
pkgver=0.3.1
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python2')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrielfalcao/couleur/tarball/$pkgver")

build() {
	cd "$srcdir/gabrielfalcao-couleur-718dcae"
	sed -i 's|version=0\.3\.1|version="0.3.1"|' setup.py
	python2 setup.py install -O1 --root="$pkgdir"
}

md5sums=('8db1637670b28f04b2dcc68e9735bfd5')
