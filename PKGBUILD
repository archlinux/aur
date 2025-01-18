# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdenoise
pkgname=vapoursynth-plugin-${_plug}
pkgver=2.7.1
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
source=("https://files.pythonhosted.org/packages/0e/4c/b09ec5ee49038ccbda19c245b75a1f10e54ad10b05eb66ef19f46a650371/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('2c01eb8fe7bccd90560473d5eaf6137732744979853cd371bdefb92bc3e9f466')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
