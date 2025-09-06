# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=1.7.2
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/8c/36/02e7cc0e8986d3fdf157d903ea148318c3d72ef033dab5a1832fd2eba49b/jetpytools-1.7.2-py3-none-any.whl")
sha256sums=('1b8a698618acd4c1a92adcdbcf766a7596fdc627204f03c417e4ac0ded148a06')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
