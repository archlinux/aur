# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.4
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-yaml' 'python-jinja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('4075b03f758541064a764bec13316f1c02b8c7963472e18b765d517fba1cbd1a634eb0f2721e52b7a1434c350280e9e1a37f7e85eef1e1ec4d29e41f920fe0ec')

package() {
  cd "$srcdir/cmake_format-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
