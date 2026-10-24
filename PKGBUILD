# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=wine-wow64-clang-v3-bin
pkgver=11.20
pkgrel=1
pkgdesc="Argonforge Clang-built Wine (64-bit) for x86-64-v3 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/wine-builds"
license=('MIT')
depends=('vulkan-icd-loader' 'sdl2' 'sdl2_ttf' 'libpng' 'libjpeg-turbo' 'fontconfig' 'freetype2' 'gettext' 'libx11' 'libxcb' 'libxext' 'libxrandr' 'libxdamage' 'libxss' 'libxxf86vm' 'openal' 'alsa-lib' 'libcups' 'libgphoto2' 'libgpg-error' 'util-linux')
options=('!strip')
source=("wine-11.20-wow64-x86-64-v3.tar.xz::https://github.com/argonforge/wine-builds/releases/download/v11.20/wine-11.20-wow64-x86-64-v3.tar.xz")
sha256sums=('5daeeedadbc19e79f31f6885e9b8a9ca850eb1c2dd614d87252f5460bd3b394b')
package() {
  cd "${srcdir}"
  bsdtar xf wine-11.20-wow64-x86-64-v3.tar.xz -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
