# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=mesa-clang-v4-bin
pkgver=25.0.7.2deb13u1
pkgrel=1
pkgdesc="Argonforge Clang-built Mesa for x86-64-v4 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/mesa-builds"
license=('MIT')
depends=('libdrm' 'libglvnd' 'zlib' 'expat' 'wayland' 'libxcb' 'libx11' 'libxext' 'libxshmfence' 'libxxf86vm')
conflicts=('mesa')
provides=('mesa' 'libgl' 'libgles' 'vulkan-mesa-layers' 'vulkan-radeon' 'vulkan-intel' 'vulkan-virtio')
options=('!strip')
source=("mesa-v25.0.7-2+deb13u1-x86-64-v4.tar.zst::https://github.com/argonforge/mesa-builds/releases/download/v25.0.7-2+deb13u1/mesa-v25.0.7-2+deb13u1-x86-64-v4.tar.zst"
        "LICENSE::https://raw.githubusercontent.com/argonforge/mesa-builds/master/LICENSE")
sha256sums=('7cfc785ebdd7183b3bfc9b9e57820cab94da0c0752b5603330a1a4a0c412263c'
            '01470cea2f6856abfbdc6702a6e59d390d39804457fb91ed8b8e147c0dd9b701')
package() {
  cd "${srcdir}"
  bsdtar xf mesa-v25.0.7-2+deb13u1-x86-64-v4.tar.zst -C "${pkgdir}"
}
