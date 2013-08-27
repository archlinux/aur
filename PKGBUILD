# Maintainer: Massimiliano Torromeo <massimiliaon.torromeo@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: miles g <miles@milesgroman.com>

pkgname=lamson
pkgver=1.3.4
pkgrel=1
pkgdesc="Modern Pythonic mail server built like a web application server"
license=("BSD")
url="http://lamsonproject.org/"
depends=('python2-jinja' 'python2-sqlalchemy' 'python2-nose' 'python2-daemon' 'python2-chardet')
source=("http://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz")
arch=('any')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('253edf385ae54606579b6b717adf5edcd9df47f9a1d488aa61b9e9f42587d37d')
