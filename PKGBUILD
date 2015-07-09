# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-os-networksv2-python-novaclient-ext
pkgver=0.21
pkgrel=5
pkgdesc="Adds rackspace networks support to python-novaclient."
arch=('any')
url="http://pypi.python.org/pypi/os_networksv2_python_novaclient_ext/"
license=('GPL')
depends=('python-novaclient' 'python-httplib2' 'python-prettytable' 'python-simplejson' 'python-iso8601')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/o/os_networksv2_python_novaclient_ext/os_networksv2_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('caa62a3cecdd441c2d90ee9ec16769ee')

build() {
	cd "$srcdir/os_networksv2_python_novaclient_ext-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/os_networksv2_python_novaclient_ext-$pkgver"
	python setup.py install --root=${pkgdir}
}
