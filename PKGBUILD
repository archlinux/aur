pkgname=hermes-cli-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="Native speech-to-text CLI daemon (prebuilt binary)"
arch=('x86_64')
url="https://github.com/adityamiskin/hermes"
license=('custom')
depends=('glibc' 'gcc-libs' 'wl-clipboard')
source_x86_64=(
  "hermes-cli-linux-x86_64-${pkgver}.tar.gz::https://github.com/adityamiskin/hermes/releases/download/v${pkgver}/hermes-cli-linux-x86_64.tar.gz"
)
sha256sums_x86_64=('48ae81b974471fb3792b8ad1b4fe419831c6ed94128baad28b3d0d97b2c23bd4')

package() {
  install -d "${pkgdir}/usr"
  cp -a "${srcdir}/hermes-cli-linux-x86_64/usr/." "${pkgdir}/usr/"
}
