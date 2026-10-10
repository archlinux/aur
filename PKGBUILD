# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from GLM 5.3 Flash.
pkgname=gamescope-builds-clang-v3-bin
pkgver=3.16.22
pkgrel=1
pkgdesc="Argonforge Clang-built gamescope для x86-64-v3 (prebuilt)"
arch=('x86_64')
url="https://github.com/argonforge/gamescope-builds"
license=('MIT')
depends=('wayland' 'libxcb' 'libx11' 'libxext' 'libxrandr' 'libxdamage' 'libxxf86vm' 'libxshmfence' 'mesa' 'vulkan-icd-loader' 'libpipewire-0.3' 'pipewire' 'pipewire-alsa' 'polkit' 'systemd' 'sqlite' 'freetype2' 'libjpeg-turbo' 'libpng' 'libxrender' 'libxcursor' 'libxfixes' 'libxcomposite' 'libxxf86dga' 'libgccjit')
options=('!strip')
source=("gamescope-3.16.22-x86-64-v3.tar.zst::https://github.com/argonforge/gamescope-builds/releases/download/v3.16.22/gamescope-3.16.22-x86-64-v3.tar.zst")
sha256sums=('SKIP')
package() {
  cd "${srcdir}"
  bsdtar xf gamescope-3.16.22-x86-64-v3.tar.zst -C "${pkgdir}"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
