# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=jetpytools
pkgname=python-${_plug}
pkgver=1.3.0
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/jetpytools'
license=('MIT')
depends=('python')
makedepends=('python-pip')
provides=('python-stgpytools')
conflicts=('python-stgpytools')
source=("https://files.pythonhosted.org/packages/ff/25/b6118315f6c0e9bd3327d8eee8c5f2642e122b42ef8316a65f0d77bd6a6a/jetpytools-1.3.0-py3-none-any.whl")
sha256sums=('68fb0efcaa23cf72514201fe5f348a485d3e89a6bb63873d9605ee2e0ca4f6b5')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
