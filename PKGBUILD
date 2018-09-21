# Maintainer: sum01 <sum01@protonmail.com>
pkgname=python-cmake-format
pkgver=0.4.3
pkgrel=1
pkgdesc='Source code formatter for cmake listfiles.'
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
depends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('2271dc9c98874c12cc2167b06965c85ef2b697f233f228dc4fdf53865f4ea5c1cb54b45d363ba65d244e56bed4ac643f5107134a3a127396a6507311fdd9f9e3')
package() {
	cd "$srcdir/cmake_format-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
