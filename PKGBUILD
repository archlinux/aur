# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdeinterlace
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.8.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-deinterlace'
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
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/e1/a9/5e358ab3759e54885e16452e955adb8771277fa0c61deaaaba9718e7f60d/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('604219eb93e62f207d5740d75b634574aec8dfe2d10e7ee2d1f0c47f5e2016bf')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
