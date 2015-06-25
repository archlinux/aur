# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-pyrax
pkgver=1.9.4
pkgrel=1
pkgdesc="Python SDK for OpenStack/Rackspace APIs"
arch=('any')
url="https://github.com/rackspace/pyrax"
license=('GPL')
depends=('python2-rackspace-novaclient>=1.3' 'python2-novaclient>=2.13.0' 'python2-requests' 'python2-keyring' 'python2-mock' 'python2-six')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=("http://pypi.python.org/packages/source/p/pyrax/pyrax-$pkgver.tar.gz")
md5sums=('aaeafbbd555decf5accea971e91740cf')

build() {
	cd "$srcdir/pyrax-$pkgver"
	python2 setup.py build
}
package() {
	cd "$srcdir/pyrax-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
