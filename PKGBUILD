# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=2.2.5
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/b0/60/8b78677077292be302ac84284987565a804ad25420cb08474b7405a70670/jetpytools-2.2.5-py3-none-any.whl")
sha256sums=('5fec12c798d12e7f4c3b7e4916303d382b82293e71d6f9aba59e729e00626bc4')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
