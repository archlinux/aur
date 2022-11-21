# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Johannes Löthberg <johannes@kyriasis.com>

pkgname=python38-pylibmc
pkgver=1.6.1
pkgrel=7

pkgdesc='Quick and small memcached client for Python'
url='https://pypi.python.org/pypi/pylibmc'
arch=('x86_64')
license=('GPL')

depends=('libmemcached' 'python38')
makedepends=('python38' 'gcc' 'zlib')

source=("https://pypi.org/packages/source/p/pylibmc/pylibmc-$pkgver.tar.gz")

sha256sums=('8a8dd406487d419d58c6d944efd91e8189b360a0c4d9e8c6ebe3990d646ae7e9')

package() {
	cd pylibmc-"$pkgver"
	python3.8 setup.py install --root="$pkgdir"
}
