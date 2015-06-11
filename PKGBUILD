# Maintainer: lothar_m
pkgname=python2-baker
pkgver=1.3
pkgrel=1
pkgdesc="Easy, powerful access to Python functions from the command line."
arch=('x86_64' 'i686')
url="https://bitbucket.org/mchaput/baker/wiki/Home"
license=('Apache License 2.0')
depends=('python2')
# makedepends=()
source=("http://pypi.python.org/packages/source/B/Baker/Baker-${pkgver}.tar.gz")
md5sums=('e628d935accf915abf6cdef77b81d8d3')

build() {
	cd "$srcdir/Baker-$pkgver"
	python2 setup.py build
}

package() {
	# install package
	cd "$srcdir/Baker-$pkgver"
	python2 setup.py install --root="$pkgdir/" --optimize=1 
}

