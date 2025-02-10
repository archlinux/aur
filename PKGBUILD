# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vskernels
pkgname=vapoursynth-plugin-${_plug}
pkgver=3.4.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-kernels'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
makedepends=('python-pip')
optdepends=('vapoursynth-plugin-resize2: Custom Scale')
source=("https://files.pythonhosted.org/packages/c1/e2/36af37c7dd68d9b61629c5e1b2b49bb9e85ed74b67968b8dd72431389e90/vskernels-3.4.2-py3-none-any.whl")
sha256sums=('9812a3469e8576cb101ddd072416d846fa2e69b8f8e3d135b2281f80f517fc84')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
