pkgname=hermes-desktop-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Native speech-to-text desktop app (prebuilt binary)"
arch=('x86_64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
depends=(
  'glibc'
  'gcc-libs'
  'gtk3'
  'webkit2gtk-4.1'
  'libsoup3'
  'libayatana-appindicator'
  'librsvg'
  'alsa-lib'
  'wl-clipboard'
)
source_x86_64=(
  "hermes-desktop-linux-x86_64-${pkgver}.tar.gz::https://github.com/adityamiskin/hermes/releases/download/v${pkgver}/hermes-desktop-linux-x86_64.tar.gz"
)
sha256sums_x86_64=('0c04a0b3a8d7c36a8adf656f367871bae0ea027f378ead53070ef657bcbff57d')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/hermes-desktop-linux-x86_64/usr/." "${pkgdir}/usr/"
}
