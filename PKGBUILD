# Maintainer: MegalithOfficial

pkgname=lettuceai-cuda-bin
pkgver=1.6.0
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
conflicts=(
  'lettuceai-bin'
  'lettuceai-vulkan-bin'
)
source=('lettuceai-linux-x86_64-cuda.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.6.0/lettuceai-linux-x86_64-cuda.tar.gz')
sha256sums=('70e33f0fc39c6cce6ff1709c43f86d535826d3cbde7fcacbf09b63c1374ce28d')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
