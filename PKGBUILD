# Maintainer: Toadtoad <kingdomkeepersguy@gmail.com>
pkgname=geode-cli-bin
pkgver=2.11.0
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
sha256sums=("414c86d8fac320dda0f1012c7458568d9ce583e110034026f733f706078ed852" "SKIP")

package() {
  install -Dm755 "${srcdir}/geode" "${pkgdir}/usr/bin/geode"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname/-bin/}/LICENSE"
}
