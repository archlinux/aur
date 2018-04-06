# Maintainer: sum01 <sum01@protonmail.com>
pkgname=python-cmake-format
pkgver=0.3.5
pkgrel=1
pkgdesc='Source code formatter for cmake listfiles.'
arch=('any')
url="https://github.com/cheshirekow/cmake_format"
license=('GPL3')
depends=('python>=3.0.0')
source=("https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('1854e97dd23117a4370f8497ed409cd42c48c7714f6288f060fc5336c82c72187489ddf1e3eacd6c053ebc605dc43af3b660c2242cbd15f6db6ca41329c533ac')
package() {
	cd "$srcdir/cmake_format-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
