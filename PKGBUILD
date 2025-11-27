# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.14.0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://codeberg.org/Soichiro/soifunc'
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
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/69/8e/90673591a14dbbda790e19d7cf55c175b0f125aa61ddc6fa0baf1352c4a4/soifunc-0.14.0-py3-none-any.whl")
sha256sums=('8528c419373c53a77d1f31bc0c2c2a21534412c81d87581cf3ee10b96eb93c17')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
