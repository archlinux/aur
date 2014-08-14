# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=python-pypeg2
pkgver=2.15.0
pkgrel=1
pkgdesc="An intrinsic PEG Parser-Interpreter for Python"
arch=(any)
url="http://fdik.org/pyPEG/"
license=('GPL2')
depends=('python')
source=("http://fdik.org/pyPEG2/pyPEG2.tar.gz")
sha1sums=('99cb44ed75b9c7adbe42dde48caf0322d5f9ab87')

package() {
  cd "$srcdir/pyPEG2-$pkgver"
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
}

# vim:set ts=2 sw=2 et:
