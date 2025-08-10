# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=1.6.1
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-pip')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/3a/74/e7a2424713172d9c5b7afd8d3a185a1c388e32dcb980d71ce4c69bdfcb9b/jetpytools-1.6.1-py3-none-any.whl")
sha256sums=('e837ec051a2d61decd9934f20101a006b75535e2d5986d6c8db5509514f8af7c')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
