pkgname=hermes-cli-bin
pkgver=0.1.4
pkgrel=1
pkgdesc="Native speech-to-text CLI daemon (prebuilt binary)"
arch=('x86_64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
depends=('glibc' 'gcc-libs' 'wl-clipboard')
source_x86_64=(
  "hermes-cli-linux-x86_64-${pkgver}.tar.gz::https://github.com/adityamiskin/hermes/releases/download/v${pkgver}/hermes-cli-linux-x86_64.tar.gz"
)
sha256sums_x86_64=('9bd247d387b4aed04e52011de7485aeae5dc4fdf19506e5fc3a377728fdad72e')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/hermes-cli-linux-x86_64/usr/." "${pkgdir}/usr/"
}
