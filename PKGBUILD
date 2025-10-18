# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/50/70/1c5c211eed9f6c975065d65347696774a48533238c6e6c5831c09df06712/jetpytools-2.0.1-py3-none-any.whl")
sha256sums=('2b574dd5ecaa85bd4c9536d82b4f7867b17bb11276bd58c1a67c94fdc54972d7')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
