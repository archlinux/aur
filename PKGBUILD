# Maintainer: MegalithOfficial

pkgname=lettuceai-cuda-bin
pkgver=1.5.1
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
source=('lettuceai-linux-x86_64-cuda.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.5.1/lettuceai-linux-x86_64-cuda.tar.gz')
sha256sums=('81d424fd2b0c96919ac4896976373c4eb8106da5a20b3905c0bd41206f2d7e49')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
