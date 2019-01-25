# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >

_name='mat4py'
pkgname="python-${_name}"
pkgver=0.4.2
pkgrel=1
pkgdesc='Load and save data in the Matlab (TM) MAT-file format.'
url="https://github.com/nephics/${_name}"
makedepends=('python-pip')
license=('MIT')
arch=('x86_64')
source=("https://files.pythonhosted.org/packages/py2.py3/${_name::1}/${_name}/${_name}-$pkgver-py2.py3-none-any.whl")
sha256sums=('debb03a4c054998fda303a3576ae624b7668e33168de95cf7a153645990f7d8d')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
}

