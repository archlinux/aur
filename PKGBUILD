# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdeband
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.2.2
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
source=("https://files.pythonhosted.org/packages/c5/2e/8c7e39ca89ea9a1b4cff597599debd215839132f038c2354d3634be25a92/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('dec2c52365c95b8fb21bc836d5372353b1f9ff25e98f45c512dd134598ab37ec')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
