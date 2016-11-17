# Maintainer: renyuneyun <renyuneyun@gmail.com>
_name=octave_kernel
pkgname=jupyter-${_name}
pkgver=0.16.1
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
makedepends=('python-pip')
options=()
source=("https://pypi.python.org/packages/67/e1/de6980e51757a197a36b9dc82ed10636aaa32e12272517a30596b21ac5a8/${_name}-${pkgver}-py2.py3-none-any.whl")
md5sums=('49032ec96b36cb54b8693933e989a2c8')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}

# vim:set ts=2 sw=2 et:
