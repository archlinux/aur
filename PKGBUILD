# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vstools
pkgname=vapoursynth-plugin-${_plug}
pkgver=3.4.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-tools'
license=('MIT')
depends=(
  'vapoursynth'
  'python-rich'
  'python-stgpytools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/e8/d3/dd0cb5310d14cb9fdbad56bcdc168a54f61f7e9a40537b6b6cd29d80ccfc/vstools-3.4.1-py3-none-any.whl")
sha256sums=('b269bfdb0ae7224af618818dd69968dc2d02e4432e76ac1739c46fe3270cacc9')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
