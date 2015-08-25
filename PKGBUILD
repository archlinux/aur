# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python2-getch
pkgver=1.0
pkgrel=1
pkgdesc="Functions to read one single char from standard input without waiting for a newline"
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('python2-setuptools')
url="https://pypi.python.org/pypi/getch"
license=('Unknown')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/g/${pkgname#python2-}/${pkgname#python2-}-$pkgver-python2.tar.gz)
md5sums=('586ea0f1f16aa094ff6a30736ba03c50')
sha256sums=('be451438f7a2b389f96753aea39b6ed2540a390f1b9a12badcbc110cf9a5ce7f')

package() {
  cd "$srcdir/${pkgname#python2-}-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
