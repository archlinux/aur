# Maintainer: renyuneyun <renyuneyun@gmail.com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.7.1
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=(
  'jupyter-notebook'
  'octave'
  'python-oct2py'
)
makedepends=('python-setuptools')
options=()
source=("https://github.com/Calysto/octave_kernel/archive/v$pkgver.tar.gz")
md5sums=('f78644bd8a9f45ad293b1c27a855222d')


package() {
  cd "$srcdir/${_name}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
