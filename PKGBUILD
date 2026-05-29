# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=mihomosh-bin
pkgver=2.3.0
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
sha256sums=('eda4d35dc59e20f66e8329df326dac4bb916f4936f3d14737cda343e363d4e63'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "${srcdir}/mihomosh" "${pkgdir}/usr/bin/mihomosh"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
