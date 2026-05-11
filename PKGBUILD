# Maintainer: MegalithOfficial

pkgname=lettuceai-cuda-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='LettuceAI desktop app (prebuilt binary, CUDA variant)'
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
  'cuda'
)
provides=('lettuceai')
conflicts=('lettuceai-bin' 'lettuceai-vulkan-bin' 'lettuceai-cuda-bin')
source=('https://github.com/LettuceAI/app/releases/download/desktop-release-1.4.1/lettuceai-linux-x86_64-cuda.tar.gz')
sha256sums=('8c30b6d9ecae0876e6f1da54c5a0691df1693f5648ae671a8541820f04a0d588')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
