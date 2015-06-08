# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgbase=python-pylibmc
pkgname=(python-pylibmc python2-pylibmc)
pkgver=1.4.1
pkgrel=2

pkgdesc="Quick and small memcached client for Python"
url='http://pypi.python.org/pypi/pylibmc'
arch=('i686' 'x86_64')
license=('GPL')

depends=('libmemcached')
makedepends=('gcc' 'zlib')

source=("https://pypi.python.org/packages/source/p/pylibmc/pylibmc-$pkgver.tar.gz")

md5sums=('eaed0ba707abc0eabb1356310febada1')

package_python-pylibmc() {
	depends=('python')

	cd pylibmc-"$pkgver"
	python setup.py install --root="$pkgdir"
}

package_python2-pylibmc() {
	depends=('python2')

	cd pylibmc-"$pkgver"
	python2 setup.py install --root="$pkgdir"
}
