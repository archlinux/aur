# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdeband
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.3.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-deband'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-vsmasktools'
  'vapoursynth-plugin-vsaa'
  'vapoursynth-plugin-vsscale'
  'vapoursynth-plugin-vsdenoise'
)
optdepends=('vapoursynth-plugin-neo_f3kdb')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/fa/d9/15cc96aa1ca7eea1c2b734b690bcb8ea541608632e59e5c738b2ce75cb9c/vsdeband-1.3.1-py3-none-any.whl")
sha256sums=('9c3a0e4ba4ea79f315980814629ff5fccd061e4490b11c9d40f26c487a0bbfca')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
