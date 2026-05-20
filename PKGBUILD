# Maintainer: MegalithOfficial

pkgname=lettuceai-vulkan-bin
pkgver=1.5.1
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
source=('lettuceai-linux-x86_64-vulkan.tar.gz::https://github.com/LettuceAI/app/releases/download/desktop-release-1.5.1/lettuceai-linux-x86_64-vulkan.tar.gz')
sha256sums=('b2900791c222f6f3bee48343ea604b1e0d43f27acc395f3f380e22bd8a51cfd8')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/usr/." "${pkgdir}/usr/"
}
