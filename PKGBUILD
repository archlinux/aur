# Maintainer: Phil Schaf <flying-sheep@web.de>

pkgname=python-aiomanhole
_pkgname=aiomanhole
pkgver=0.2.1
pkgrel=1
pkgdesc='Manhole for accessing asyncio applications'
url='https://github.com/nathan-hoad/aiomanhole'
arch=('any')
license=('Apache')
depends=('python>=3.3')
source=("https://pypi.python.org/packages/source/a/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('a67b1df5ae3ed6bce9682941e18accfe')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}