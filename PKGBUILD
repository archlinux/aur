# Maintainer: renyuneyun <renyuneyun@gmail.com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.18.0
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
source=("https://pypi.python.org/packages/5b/58/5c1474dd48bc808419eca963a9a0e62c2b0016ee2ebb0f588c269d1f3e99/octave_kernel-0.18.0-py2.py3-none-any.whl")
md5sums=('d62ba1a1df73b0e0e64ead7280761ca0')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
