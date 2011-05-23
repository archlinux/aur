pkgname=morbid
pkgver=0.8.7.3
pkgrel=2
pkgdesc="A Twisted-based publish/subscribe messaging server that uses the STOMP protocol"
arch=("any")
url="http://pypi.python.org/pypi/morbid/"
license=('MIT')
depends=(python2)
makedepends=(python2-distribute)
md5sums=("5a2458def7e583a10c46c046dbab9c4a")
source=(http://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --root=$startdir/pkg --prefix=/usr
}

# vim:set ts=2 sw=2 et:
