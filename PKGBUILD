# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vssource
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.12.2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-source'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
optdepends=(
  'vapoursynth-plugin-bestsource'
  'vapoursynth-plugin-lsmashsource'
  'vapoursynth-plugin-d2vsource'
  'vapoursynth-plugin-dgdecodenv'
  'vapoursynth-plugin-imwri'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/0c/7f/ec340a76881d5bccf65d7c3379ca3b6bbc9b1e5b07e70433ed41189dc137/vssource-0.12.2-py3-none-any.whl")
sha256sums=('1104d0821a6915df9f8842e73057e0edd6ffe29614ef235c16b2290d62bdfb37')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
