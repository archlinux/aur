# Maintainer: MegalithOfficial

pkgname=lettuceai-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='LettuceAI desktop app (prebuilt binary, CPU variant)'
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
)
provides=('lettuceai')
conflicts=(
  'lettuceai-vulkan-bin'
  'lettuceai-cuda-bin'
)
source=('lettuceai-linux-x86_64-cpu.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.5.1/lettuceai-linux-x86_64-cpu.tar.gz')
sha256sums=('e3956992a817f04adf1f7dd5130dd0eef416e4df0b043b9623a3500624bc251d')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
