# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=3.1.0
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python' 'python-typing_extensions')
makedepends=('python-installer')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/8b/ea/308c2e2e5d6ce99c1de66519458785b3c9546d3c3485ec63f9411d508ecb/jetpytools-3.1.0-py3-none-any.whl")
sha256sums=('5fc673cee60c5483a858217972ef6590a570a6353f61de9c28358c14db2b6ebc')

package() {
	python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
