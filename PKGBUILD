# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsmasktools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.3.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-masktools'
license=('MIT')
depends=('vapoursynth-plugin-vstools'
  'vapoursynth-plugin-vskernels'
  'vapoursynth-plugin-vsexprtools'
  'vapoursynth-plugin-vsrgtools'
  'vapoursynth-plugin-tcanny'
  'vapoursynth-plugin-tedgemask'
  'vapoursynth-plugin-awarpsharp2'
  'vapoursynth-plugin-retinex'
  'vapoursynth-plugin-planestatsmod'
  'vapoursynth-plugin-vssource'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/30/8a/a670c0d110c85f47bb64932837a805a2149870faafcff5eeea2c8a546f25/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('5c0e84e9ad616e8a4f6b78af78afbf32738d607435b1e75b55b0f7a7545b03bd')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
