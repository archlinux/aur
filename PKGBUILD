# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-pypeg2
pkgver=2.15.1
pkgrel=1
pkgdesc="An intrinsic PEG Parser-Interpreter for Python"
arch=(any)
url="http://fdik.org/pyPEG/"
license=('GPL2')
depends=('python')
source=("https://pypi.python.org/packages/source/p/pyPEG2/pyPEG2-${pkgver}.tar.gz")
md5sums=('10341d1fd733e6382c4562e4a81570cb')

package() {
  cd "$srcdir/pyPEG2-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et ft=sh:
