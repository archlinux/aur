# Maintainer: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python-pylibmc
pkgver=1.4.1
pkgrel=1

pkgdesc="Quick and small memcached client for Python"
url="http://pypi.python.org/pypi/pylibmc"
arch=("i686" "x86_64")
license=("GPL")

depends=("python" "libmemcached")
makedepends=("gcc" "zlib")

source=("https://pypi.python.org/packages/source/p/pylibmc/pylibmc-$pkgver.tar.gz")

md5sums=('eaed0ba707abc0eabb1356310febada1')

package() {
	cd pylibmc-"$pkgver"
	python setup.py install --root="$pkgdir"
}
