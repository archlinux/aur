# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=geode-cli-bin
pkgver=3.0.1
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
sha256sums=("5fefac934f62e3ac67c126e81dbec7a1d57026b68332972f69c3973b32c075c9" "SKIP")

package() {
  install -Dm755 "${srcdir}/geode" "${pkgdir}/usr/bin/geode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/LICENSE"
}
