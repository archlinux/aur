# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=cmake-format
pkgver=0.6.6
pkgrel=1
pkgdesc='Source code formatter for CMake listfiles'
arch=('any')
url='https://github.com/cheshirekow/cmake_format'
license=('GPL3')
depends=('python-setuptools' 'python-yaml' 'python-jinja')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cheshirekow/cmake_format/archive/v${pkgver}.tar.gz")
sha512sums=('d48f672cb7578393a36f448ad1db980d710e1da7996122de892cb482cdd68f090cf72bafc3cd706dea6440c0c73d8d922075b5d8645835e60f7a7df419455f05')

package() {
  cd "$srcdir/cmake_format-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
