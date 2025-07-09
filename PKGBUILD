# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.11.1
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
source=("https://files.pythonhosted.org/packages/27/eb/1e1f268e7523aba68d5714e4838084c60ce8d97fe0121117c3cb0b814149/soifunc-0.11.1-py3-none-any.whl")
sha256sums=('cadae02c4b5208ef745e05973056be721c113098faf4620a24f417de5bffc618')

package() {
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps "${_plug}-${pkgver}-py3-none-any.whl"
}
