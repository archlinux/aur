# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.11.3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/shssoichiro/soifunc'
license=('MIT')
depends=('vapoursynth'
  'vapoursynth-plugin-znedi3'
  'vapoursynth-plugin-vsjetpack'
)
optdepends=('vapoursynth-plugin-bm3dcuda: BM3D support, GPU version'
  'vapoursynth-plugin-bm3dcuda-cpu: BM3D support, CPU version'
  'vapoursynth-plugin-dfttest2: dfttest support, GPU version'
  'vapoursynth-plugin-dfttest2-cpu: dfttest support, CPU version'
  'vapoursynth-plugin-mlrt: frame interpolation functions'
  'vapoursynth-plugin-mlrt-ext-models-rife: frame interpolation functions'
)
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/dc/d7/ebe16b8a642d4aaf9cc056e2b254feffe11e0d718d93591131b07cfce2fb/soifunc-0.11.3-py3-none-any.whl")
sha256sums=('8734fe41a91589bff597e92d9fbf359106a9c6cfa292783dedf04e830bf84548')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
