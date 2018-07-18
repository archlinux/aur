# Maintainer: sum01 <sum01@protonmail.com>
pkgname=python-cmake-format
pkgver=0.4.1
pkgrel=3
pkgdesc='Source code formatter for cmake listfiles.'
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('46653b601470b512b39bc8c88c63165c641a8e30b0245c4d1d2033e81a715f52e2b985b7b09a449a562824d30d41451aacfcacbf3edf8397d1c0d0481f820920')
package() {
	cd "$srcdir/cmake_format-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
