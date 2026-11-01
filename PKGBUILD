# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Nemotron 3.5 Lightning 30B A3B.
pkgname=wine-wow64-clang-v4-bin
pkgver=11.21
pkgrel=1
pkgdesc="Argonforge Clang-built Wine (64-bit) for x86-64-v4 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/wine-builds"
license=('MIT')
depends=('vulkan-icd-loader' 'sdl2' 'sdl2_ttf' 'libpng' 'libjpeg-turbo' 'fontconfig' 'freetype2' 'gettext' 'libx11' 'libxcb' 'libxext' 'libxrandr' 'libxdamage' 'libxss' 'libxxf86vm' 'openal' 'alsa-lib' 'libcups' 'libgphoto2' 'libgpg-error' 'util-linux')
options=('!strip')
source=("wine-11.21-wow64-x86-64-v4.tar.xz::https://github.com/argonforge/wine-builds/releases/download/v11.21/wine-11.21-wow64-x86-64-v4.tar.xz")
sha256sums=("a749feefeaee81790b9bb70eb3dd045e4f82c6717831294d12ecedfd23651f7c")
package() {
  cd "${srcdir}"
  bsdtar xf wine-11.21-wow64-x86-64-v4.tar.xz -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
