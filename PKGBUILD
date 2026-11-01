# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.
pkgname=vkd3d-proton-clang-v4-bin
pkgver=3.1
pkgrel=1
pkgdesc="Argonforge Clang-built vkd3d-proton for x86-64-v4 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/vkd3d-proton-builds"
license=('MIT')
depends=('vulkan-icd-loader')
options=('!strip')
source=("vkd3d-proton-${pkgver}-x86-64-v4.tar.zst::https://github.com/argonforge/vkd3d-proton-builds/releases/download/v${pkgver}/vkd3d-proton-${pkgver}-x86-64-v4.tar.zst")
sha256sums=('219355281bb8280c8f74c8e4217635f2d3a3f1ce209b57cf2e9b50880c42c754')
package() {
  cd "${srcdir}"
  bsdtar xf vkd3d-proton-${pkgver}-x86-64-v4.tar.zst -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
