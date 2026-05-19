# Maintainer: MegalithOfficial

pkgname=lettuceai-vulkan-bin
pkgver=1.5.0
pkgrel=2
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
source=('lettuceai-linux-x86_64-vulkan.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.5.0/lettuceai-linux-x86_64-vulkan.tar.gz')
sha256sums=('9a0f1766df772429dd7a811cdf66f72ea8f43a0c4ea0c7de77c42b038828a28b')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
