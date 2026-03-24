# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=2.2.6
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/5e/b6/312c3af823e95353e0c5192a36a86c5fe44edde46a1e8c9ed945d8f4bf7a/jetpytools-2.2.6-py3-none-any.whl")
sha256sums=('12314ee3b016b172c72d007c3823265deb462021bfd41eaee332b4928c44a838')

package() {
	python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
