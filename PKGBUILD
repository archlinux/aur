# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=geode-cli-bin
pkgver=3.0.0
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
sha256sums=("25fb964d4ecc69b9cfa5626c53cc8ecedc476876fa59099efcaf511648920d1b" "SKIP")

package() {
  install -Dm755 "${srcdir}/geode" "${pkgdir}/usr/bin/geode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/LICENSE"
}
