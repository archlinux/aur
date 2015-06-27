# Maintainer: Tom Tryfonidis <tomtryf@gmail.com>
# Contributors: Tom Tryfonidis <tomtryf@gmail.com>

pkgname=python2-requestbuilder
pkgver=0.2.3
pkgrel=1
pkgdesc="Command line-driven HTTP request builder."
arch=('any')
url=https://github.com/boto/requestbuilder
license=(ISC)
depends=('python2' 'python2-six' 'python2-requests')
makedepends=('python2-setuptools')
source=(https://pypi.python.org/packages/source/r/requestbuilder/requestbuilder-$pkgver.tar.gz)
md5sums=('3d9793e3a3b3dad23a8475e0480581db')

build() {
	cd "$srcdir/requestbuilder-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/requestbuilder-$pkgver"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
