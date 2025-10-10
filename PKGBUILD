# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=1.7.3
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/4e/7e/627274b4f17e5c7198ea5de8ec6c7bb92fc9ca31395af375c27dfcbeacbe/jetpytools-1.7.3-py3-none-any.whl")
sha256sums=('e1583689ce572b1e660672877939777c40b7db83b972eb111113f9d72bcd2057')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
