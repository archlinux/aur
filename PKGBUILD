# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=2.2.1
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/db/e3/594ba963ca3d2982ed03cea292623b7f8c53b9734f4a87678eb835d0797c/jetpytools-2.2.1-py3-none-any.whl")
sha256sums=('00452111c2584dd439f96ff94a9c585e8357916a53f71e0108fe94b32ca536f6')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
