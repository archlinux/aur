# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdenoise
pkgname=vapoursynth-plugin-${_plug}
pkgver=2.8.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-denoise'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-vsmasktools'
  'vapoursynth-plugin-vsaa'
  'vapoursynth-plugin-vsscale'
)
makedepends=('python-pip')
optdepends=(
  'vapoursynth-plugin-nlm-cuda'
  'vapoursynth-plugin-knlmeanscl'
  'vapoursynth-plugin-bm3d'
  'vapoursynth-plugin-bm3dcuda'
  'vapoursynth-plugin-reconstruct'
)
source=("https://files.pythonhosted.org/packages/27/bd/1750118f291abd5a24d41e0ab8ede77da36b5c6d904fb05fe6ac8754405a/vsdenoise-2.8.1-py3-none-any.whl")
sha256sums=('6f5f42fa19a7fe1ef6752357e4343d188e6c5a852ddb819588b97efbae9475bc')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
