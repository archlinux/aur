# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsdeinterlace
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.9.1
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
source=("https://files.pythonhosted.org/packages/c1/05/d50386d14e6a297332f175b8c4575a1e8aff3baaca342bd7766f0d344874/vsdeinterlace-0.9.1-py3-none-any.whl")
sha256sums=('73594ab041a3aabc096e7f565ffb40262f4919e6dfe93de1882e2ce6405a92f2')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
