# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-oauth2
pkgver=1.5.170
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A fully tested, abstract interface to creating OAuth clients and servers"
arch=(any)
url="https://github.com/simplegeo/python-oauth2"
license=('GPL')
depends=(python2)
source=(http://pypi.python.org/packages/source/${_libname:0:1}/$_libname/$_libname-$pkgver.tar.gz)
md5sums=(5cca4f4ce2225781c2d91e19aad207f5)

build() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --root=$pkgdir
}
