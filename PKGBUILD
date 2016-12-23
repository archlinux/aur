# Maintainer: renyuneyun <renyuneyun@gmail.com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.19.9
pkgrel=1
pkgdesc="A Jupyter kernel for Octave"
arch=('any')
url="https://github.com/Calysto/octave_kernel"
license=('BSD')
depends=(
  'jupyter-notebook'
  'octave'
  'python-oct2py'
  'jupyter-metakernel'
)
makedepends=('python-pip')
optdepends=(
  'gnuplot: for making plots'
)
options=()
source=("https://pypi.python.org/packages/be/54/3a3c1428923a01b7b12425db808ffc0b40d707f2bd5a67f530f383f71195/octave_kernel-0.19.9-py2.py3-none-any.whl")
md5sums=('47f81acb864a6c0ebdfbc91fadcb8c11')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
