# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.14.1
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
source=("https://files.pythonhosted.org/packages/61/47/01c90891a85e96aaac7286788f5fd9df9cc0752134467bfa999b63496e9c/soifunc-0.14.1-py3-none-any.whl")
sha256sums=('c1cf246365e3c7be8d0127dfad443486f608a838d1fb04ee52061a15c2e0df55')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
