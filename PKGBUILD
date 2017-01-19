# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname="python-haxor"
pkgver=0.3.1
pkgrel=1
pkgdesc="Python wrapper for the Hacker News API"
arch=("any")
url="https://pypi.python.org/pypi/pycrypto"
license=("MIT")
depends=("python-requests")
makedepends=("python-distribute")
source=("http://pypi.python.org/packages/source/h/haxor/haxor-${pkgver}.tar.gz")
md5sums=('291b679fc95d14d75cfd08f0818c024d')

build() {
	cd "${srcdir}/haxor-${pkgver}"
	python ./setup.py build
}

package() {
	cd "${srcdir}/haxor-${pkgver}"
	python setup.py install --root="$pkgdir" --optimize=1
}
