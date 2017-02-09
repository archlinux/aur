# Contributor: tembleking <tembleking at gmail dot com>
pkgname=python2-gpxpy
pkgver=1.1.2
pkgrel=1
pkgdesc="Python GPX (GPS eXchange format) parser"
arch=(any)
url="https://github.com/tkrajina/gpxpy"
license=('Apache')
depends=('python2' 'python2-lxml>=3.1.2')
makedepends=('python2-setuptools')
provides=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/51/3c/29004507bc4d5c1248a1a37ec01c2030b2e977609c219244d81f3041b745/gpxpy-$pkgver.tar.gz")

package() {
	cd "${srcdir}/gpxpy-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

md5sums=('8abc7b53147e9632c77ab1e6605619d6')
