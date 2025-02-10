# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=vsmasktools
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.4.1
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
source=("https://files.pythonhosted.org/packages/01/29/b2bb6e659533914f5391d75057bc4c45c0fe7670fa963c6788eabeee0e4a/vsmasktools-1.4.1-py3-none-any.whl")
sha256sums=('a39e9bd978401c3aefa47813b7964a759220077da80dbf83e8d208b2ebb87156')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
