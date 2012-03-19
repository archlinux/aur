# Maintainer: Massimiliano Torromeo <massimiliaon.torromeo@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: miles g <miles@milesgroman.com>

pkgname=lamson
pkgver=1.1
pkgrel=2
pkgdesc="Modern Pythonic mail server built like a web application server"
license=("GPL3" "BSD")
url="http://lamsonproject.org/"
depends=('python2-jinja' 'python2-sqlalchemy' 'python2-nose' 'python2-daemon' 'python2-chardet')
source=("http://pypi.python.org/packages/source/l/$pkgname/$pkgname-$pkgver.tar.gz")
arch=('any')
options=(!emptydirs)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}

md5sums=('a5673d0fe9e8def9d2dfe9705f832a83')
