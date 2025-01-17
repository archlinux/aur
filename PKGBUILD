# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vspyplugin
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.4.3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/Jaded-Encoding-Thaumaturgy/vs-pyplugin'
license=('MIT')
depends=(
  'vapoursynth-plugin-vstools'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/d8/94/2c129d22cbd2892a422604734091dba96f7e3aba51d5ac57b9fd7d3d38ca/${_plug}-${pkgver}-py3-none-any.whl")
sha256sums=('44dab08aa0f8924b9c8f12a1e2617aeba5b619e916e54750be6a154457c9b50d')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
