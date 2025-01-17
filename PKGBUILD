# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vskernels
pkgname=vapoursynth-plugin-${_plug}
pkgver=3.3.1
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
source=("https://files.pythonhosted.org/packages/55/10/e67f3c90fdf8a0a79ec0774224c1e1d1bde2bb52bf6fe4c8fb47c41cb873/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('03a0efa381c149ca10bd8177ee1a6cc6755d8d20f3610467fb008e4c48fe6fc8')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
