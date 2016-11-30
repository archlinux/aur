# Maintainer: renyuneyun <renyuneyun@gmail.com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.17.2
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
source=("https://pypi.python.org/packages/f9/4d/62261029810faf6492dd70ed87dfd2c164aac77f568bde11715941d8c3d9/octave_kernel-0.17.2-py2.py3-none-any.whl")
sha384sums=('d8a8521ee966bdcb6a530b7c211253bbf8e4fd1b40d493bf291331189add8c50bde824ad2bf46150a693cdc32526f7eb')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
