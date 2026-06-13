# Maintainer: MegalithOfficial

pkgname=lettuceai-bin
pkgver=1.6.0
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
source=('lettuceai-linux-x86_64-cpu.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.6.0/lettuceai-linux-x86_64-cpu.tar.gz')
sha256sums=('55c1a15d5ce3c23b01dc77ad50991c9d757693ee4c5dfc2ecfb41d44dd0144ae')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
