# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=mesa-clang-v3-bin
pkgver=25.0.7.2deb13u1
pkgrel=1
pkgdesc="Argonforge Clang-built Mesa for x86-64-v3 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/mesa-builds"
license=('MIT')
depends=('libdrm' 'libglvnd' 'zlib' 'expat' 'wayland' 'libxcb' 'libx11' 'libxext' 'libxshmfence' 'libxxf86vm')
conflicts=('mesa')
provides=('mesa' 'libgl' 'libgles' 'vulkan-mesa-layers' 'vulkan-radeon' 'vulkan-intel' 'vulkan-virtio')
options=('!strip')
# sha256sums calculated from official release tarballs.
# Upstream occasionally re-uploads release assets, so checksums may need updating.
source=("mesa-v25.0.7-2+deb13u1-x86-64-v3.tar.zst::https://github.com/argonforge/mesa-builds/releases/download/v25.0.7-2+deb13u1/mesa-v25.0.7-2+deb13u1-x86-64-v3.tar.zst"
        "LICENSE::https://raw.githubusercontent.com/argonforge/mesa-builds/master/LICENSE")
sha256sums=('SKIP'
            'SKIP')
package() {
  cd "${srcdir}"
  bsdtar xf mesa-v25.0.7-2+deb13u1-x86-64-v3.tar.zst -C "${pkgdir}"
}
