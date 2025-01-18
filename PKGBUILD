# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsscale
pkgname=vapoursynth-plugin-${_plug}
pkgver=2.2.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-scale'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-vsmasktools'
  'vapoursynth-plugin-vsaa'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/49/16/f79e83868faf0fc0e78ea50c7fd5003916bde47d57376f97b611e80748a0/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('813782bd384ec652f3a8dfd96d0d71df5d88769c4d254268336382633b0bb264')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
