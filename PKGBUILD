# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsrgtools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.9.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-rgtools'
license=('MIT')
depends=(
  'vapoursynth'
  'vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
)
makedepends=('python-pip')
optdepends=(
  'vapoursynth-plugin-removegrain'
  'vapoursynth-plugin-rgsf'
  'vapoursynth-plugin-vsakarin'
  'vapoursynth-plugin-vszip'
)
source=("https://files.pythonhosted.org/packages/16/83/41b7807e0dac0fbb84ac80de7e9c531b29b123058d0e06bc7fad407c61c5/vsrgtools-1.9.0-py3-none-any.whl")
sha256sums=('e6c9874b62dfcda7898872a9642821e52bbd60237d1e1001115c68b4a6dc4fc6')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
