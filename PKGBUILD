# Maintainer: MegalithOfficial

pkgname=lettuceai-cuda-bin
pkgver=1.5.0
pkgrel=2
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
conflicts=(
  'lettuceai-bin'
  'lettuceai-vulkan-bin'
)
source=('lettuceai-linux-x86_64-cuda.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.5.0/lettuceai-linux-x86_64-cuda.tar.gz')
sha256sums=('6898f37182ae2e25c4f257118e2ba97965c8699913f88400a93fdeec432dbfe5')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
