# Maintainer: Anselmo L. S. Melo <anselmolsm@gmail.com>
_pkgname=gantt
pkgname=python-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc="Python-Gantt make possible to easily draw gantt charts from Python. Output format is SVG."
arch=('any')
url="http://xael.org/pages/python-gantt-en.html"
license=('GPL3')
depends=('python' 'python-svgwrite' 'python-dateutil')
optional=('python-clize')
source=('http://xael.org/pages/python-gantt-0.6.0.tar.gz')
md5sums=('4c94fede2f314e4735b2a69a84bdcca6')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python3 setup.py install --root=$pkgdir --optimize=1 --skip-build
}

# vim:set sw=2 et:
