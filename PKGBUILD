# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=stgpytools
pkgname=python-${_plug}
pkgver=1.2.2
pkgrel=1
pkgdesc="Python package: ${_plug}"
arch=('any')
url='https://github.com/Setsugennoao/stgpytools'
license=('MIT')
depends=('python')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/f6/a9/a47895e62a7a397ad39e867743428c28e2b3f47bcbe5cec087786eb83b6f/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('c8d919a33a9f4d7090759e023ac80ca814c71f6bafaf2696a8b023b06a377f8d')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
