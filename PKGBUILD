# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.7
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-yaml' 'python-jinja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('1d1a637ea5e91540030c3b28606bc211d8d6951d96d84b0318c5a9261be06dd81c929827eae3090aa75004be70d059fe6f5b580854ea093c1aebe19b087bb734')

package() {
  cd "$srcdir/cmake_format-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
