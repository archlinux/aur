# Maintainer: MegalithOfficial

pkgname=lettuceai-vulkan-bin
pkgver=1.6.0
pkgrel=1
pkgdesc='LettuceAI desktop app (prebuilt binary, Vulkan variant)'
arch=('x86_64')
url='https://github.com/LettuceAI/app'
license=('AGPL-3.0-only')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'librsvg'
  'speech-dispatcher'
  'openssl'
  'vulkan-icd-loader'
)
provides=('lettuceai')
conflicts=(
  'lettuceai-bin'
  'lettuceai-cuda-bin'
)
source=('lettuceai-linux-x86_64-vulkan.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.6.0/lettuceai-linux-x86_64-vulkan.tar.gz')
sha256sums=('a6145822c51a5fd3ac92865da4bf609c32c9ca453594ee1ff9ee7d4b375c03c1')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
