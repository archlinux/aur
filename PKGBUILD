# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-os-diskconfig-python-novaclient-ext
pkgver=0.1.2
pkgrel=3
pkgdesc="Disk Config extension for python-novaclient"
arch=('any')
url="http://pypi.python.org/pypi/os_diskconfig_python_novaclient_ext/"
license=('GPL')
depends=('python2' 'python2-novaclient' 'python2-httplib2' 'python2-prettytable' 'python2-simplejson' 'python2-iso8601')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/o/os_diskconfig_python_novaclient_ext/os_diskconfig_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('e52dc0e8459402fa4f493715d26b5dd7')

build() {
	cd "$srcdir/os_diskconfig_python_novaclient_ext-$pkgver"
	python2 setup.py build
}

package() {
	cd "$srcdir/os_diskconfig_python_novaclient_ext-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
