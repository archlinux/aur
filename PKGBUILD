# Maintainer: Troy C < rstrox -ta yahoo -tod com >

pkgname=python2-rax-default-network-flags-python-novaclient-ext
pkgver=0.2.4
pkgrel=1
pkgdesc="Novaclient Extension for Instance Default Network Flags"
arch=('any')
url="http://pypi.python.org/pypi/rax_default_network_flags_python_novaclient_ext/"
license=('GPL')
depends=('python2-novaclient' 'python2-httplib2' 'python2-prettytable' 'python2-simplejson' 'python2-iso8601')
makedepends=('python2-setuptools')
provides=("$pkgname=$pkgver")
source=(http://pypi.python.org/packages/source/r/rax_default_network_flags_python_novaclient_ext/rax_default_network_flags_python_novaclient_ext-${pkgver}.tar.gz)
md5sums=('3554dbe043147a6df3d3f7225888be92')

build() {
	cd "$srcdir/rax_default_network_flags_python_novaclient_ext-$pkgver"
	python2 setup.py build

}

package() {
	cd "$srcdir/rax_default_network_flags_python_novaclient_ext-$pkgver"
	python2 setup.py install --root=${pkgdir}
}
