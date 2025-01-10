# Maintainer: Hybridkernel <admin@hzqki.me>

_plug=rife-ncnn-vulkan
pkgname=vapoursynth-plugin-${_plug}-bin
pkgver=r9_mod_v32
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/releases/tag/r9_mod_v32'
license=('MIT')
depends=('vapoursynth')
makedepends=(
  'git'
  'meson'
  'cmake'
  'vulkan-headers'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=(
  "https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/releases/download/${pkgver}/librife_linux_x86-64.so"
  "https://github.com/styler00dollar/VapourSynth-RIFE-ncnn-Vulkan/raw/refs/heads/master/LICENSE"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

package(){
  install -Dm644 "${srcdir}/librife_linux_x86-64.so" "${pkgdir}/usr/lib/vapoursynth/librife.so"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

