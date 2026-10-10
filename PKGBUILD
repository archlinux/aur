# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=vkd3d-proton-clang-v4-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="Argonforge Clang-built vkd3d-proton for x86-64-v4 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/vkd3d-proton-builds"
license=('MIT')
depends=('vulkan-icd-loader')
options=('!strip')
source=("vkd3d-proton-3.0.1-x86-64-v4.tar.zst::https://github.com/argonforge/vkd3d-proton-builds/releases/download/v3.0.1/vkd3d-proton-3.0.1-x86-64-v4.tar.zst")
sha256sums=('SKIP')
package() {
  cd "${srcdir}"
  bsdtar xf vkd3d-proton-3.0.1-x86-64-v4.tar.zst -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
