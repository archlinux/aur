# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python-os-networksv2-python-novaclient-ext
pkgver=0.25
pkgrel=1
pkgdesc="Adds rackspace networks support to python-novaclient."
arch=('any')
url="http://pypi.python.org/pypi/os_networksv2_python_novaclient_ext/"
license=('GPL')
depends=('python-novaclient' 'python-httplib2' 'python-prettytable' 'python-simplejson' 'python-iso8601')
makedepends=('python-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/o/os_networksv2_python_novaclient_ext/os_networksv2_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('4ab769b99fb600825bb18efbf01bafb6')

build() {
	cd "$srcdir/os_networksv2_python_novaclient_ext-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/os_networksv2_python_novaclient_ext-$pkgver"
	python setup.py install --root=${pkgdir}
}
