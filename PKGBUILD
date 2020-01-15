# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name=rax_default_network_flags_python_novaclient_ext
pkgname=python-rax-default-network-flags-python-novaclient-ext
pkgver=0.4.0
pkgrel=1
pkgdesc="Novaclient Extension for Instance Default Network Flags"
arch=('any')
url="http://pypi.python.org/pypi/rax_default_network_flags_python_novaclient_ext/"
license=('GPL')
depends=('python-novaclient' 'python-httplib2' 'python-prettytable' 'python-simplejson' 'python-iso8601')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('8856de2ea7635b3628ff89f0aafdc33f')


build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
