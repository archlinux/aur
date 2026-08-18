# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >

_name='mat4py'
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=1
pkgdesc='Load and save data in the Matlab (TM) MAT-file format.'
url="https://github.com/nephics/${_name}"
makedepends=('python-pip')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-any.whl")
sha256sums=('1c15f39c7df092f01506044f65999fc9c7d71306f8fc850b1003e15ed64c6bae')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
}

