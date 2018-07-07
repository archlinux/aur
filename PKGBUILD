# Maintainer: sum01 <sum01@protonmail.com>
pkgname=python-cmake-format
pkgver=0.4.0
pkgrel=1
pkgdesc='Source code formatter for cmake listfiles.'
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
depends=('python>=3.0.0')
source=("https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('fe0d35e711a25a54b12e49845ed11456675e847fc75c9e9ff1f8704edd8fbe078ff9da2a3ba06e5f1a8957212d7360b618540bdccff5df86d982583ebf6f9859')
package() {
	cd "$srcdir/cmake_format-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
