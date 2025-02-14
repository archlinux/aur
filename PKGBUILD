# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=1.2.3
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-pip')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/f6/e7/d7c077c137c587b4a944aa89bbd5589bb71cccc6aea6183922ecd36dfdb5/jetpytools-1.2.3-py3-none-any.whl")
sha256sums=('d1fb1bf991b2e74febe8eea21f55d5bc665dd06537c29da5ac0bd99a139c1919')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
