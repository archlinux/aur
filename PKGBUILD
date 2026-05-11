# Maintainer: MegalithOfficial

pkgname=lettuceai-bin
pkgver=1.4.1
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
conflicts=('lettuceai-bin' 'lettuceai-vulkan-bin' 'lettuceai-cuda-bin')
source=('https://github.com/LettuceAI/app/releases/download/desktop-release-1.4.1/lettuceai-linux-x86_64-cpu.tar.gz')
sha256sums=('c95087ddfe0b47c2f9e6549ae4eb6153f38d5a2bc23456a31ceb5706113bfa31')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
