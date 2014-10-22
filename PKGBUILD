# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-couleur
pkgver=0.5.0
pkgrel=1
pkgdesc="ANSI terminal tool for python, colored shell and other handy fancy features"
url="https://github.com/gabrielfalcao/couleur"
license=(APACHE)
depends=('python2')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gabrielfalcao/couleur/tarball/$pkgver")

build() {
	cd "$srcdir/gabrielfalcao-couleur-a1889fc"
	python2 setup.py build
}

package() {
	cd "$srcdir/gabrielfalcao-couleur-a1889fc"
	python2 setup.py install --skip-build -O1 --root="$pkgdir"
}

sha256sums=('e828cd812a25089768d3a4af059b16f8c61f2249bb670ac2e0671e425dd51498')
