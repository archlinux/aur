# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=mihomosh-bin
pkgver=2.3.2
pkgrel=1
pkgdesc="A CLI Toolkit for Mihomo (prebuilt binary)"
arch=('x86_64')
url="https://github.com/SamuNatsu/mihomosh"
license=('GPL3')
provides=('mihomosh')
conflicts=('mihomosh')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/SamuNatsu/mihomosh/releases/download/v${pkgver}/mihomosh-Linux-musl-x86_64.tar.gz"
  "LICENSE::https://raw.githubusercontent.com/SamuNatsu/mihomosh/v${pkgver}/LICENSE"
)
sha256sums=('ff916ec2b8575a788889dc889531b22f38a6a00837ea58721e9bee0d6f6e7868'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "${srcdir}/mihomosh" "${pkgdir}/usr/bin/mihomosh"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
