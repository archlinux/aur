# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

_pypiname=PyGObject-stubs
_pkgname=pygobject-stubs
pkgname="python-${_pkgname}"
pkgver=1.0.0
pkgrel=2
pkgdesc="PEP 561 Typing Stubs for PyGObject."
arch=('any')
url='https://github.com/pygobject/pygobject-stubs'
license=('LGPL')
makedepends=('python' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/P/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
sha512sums=('a4766a54caa06c21ee176ab4d3d174f8fa70f0ee1fb300ebde4746377a40dd91d54e027ef9aa60dc9346b26966f85fc2a98bda9fd25aa17174000de262126713')

package() {
  cd ${_pypiname}-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
