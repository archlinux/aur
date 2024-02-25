# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=geode-cli-bin
pkgver=2.12.0
pkgrel=1
pkgdesc="Command-line utilities for working w/ geode, a Geometry Dash modding SDK"
arch=('x86_64')
url="https://github.com/geode-sdk/cli"
license=('BSL-1.0')

provides=('geode-cli')
conflicts=('geode-cli')

source=(
  "https://github.com/geode-sdk/cli/releases/download/v${pkgver}/geode-cli-v${pkgver}-linux.zip"
  "https://raw.githubusercontent.com/geode-sdk/cli/v${pkgver}/LICENSE"
)
sha256sums=("c0429fd4cafcac24373ea50ca9fdbc79ca6b8830b1b69e85d747150ee5e07de9" "SKIP")

package() {
  install -Dm755 "${srcdir}/geode" "${pkgdir}/usr/bin/geode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/LICENSE"
}
