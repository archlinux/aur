# Maintainer: sum01 <sum01@protonmail.com>
pkgname=python-cmake-format
pkgver=0.3.6
pkgrel=1
pkgdesc='Source code formatter for cmake listfiles.'
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
depends=('python>=3.0.0')
source=("https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('01b3fe1acf8e971f88f9078813e18e73b11e4d79b67a6dd5085621f216af735c19056a22fe2ae723f093af1dbd77b93ee953e7e44fba7f5998922944e7d997e8')
package() {
	cd "$srcdir/cmake_format-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
