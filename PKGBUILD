# Maintainer: MegalithOfficial

pkgname=lettuceai-vulkan-bin
pkgver=1.4.1
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
conflicts=('lettuceai-bin' 'lettuceai-vulkan-bin' 'lettuceai-cuda-bin')
source=('https://github.com/LettuceAI/app/releases/download/desktop-release-1.4.1/lettuceai-linux-x86_64-vulkan.tar.gz')
sha256sums=('b804e5e7be6eb9188e8798cd816333115b988d71ac34f26c702817d832f036bd')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
