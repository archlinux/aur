# Maintainer: Josh Holmer <jholmer.in@gmail.com>

_plug=soifunc
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.12.0
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
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/fb/c6/06022ef57b9f46c566e2188898f43f2f08288e37cfb252f342e899a4348b/soifunc-0.12.0-py3-none-any.whl")
sha256sums=('97ae447011d7f8afc67f7e34bb50244178c95d68da234523770bfe96e1ea239e')

package() {
  python -m installer --destdir="$pkgdir" "${_plug}-${pkgver}-py3-none-any.whl"
}
