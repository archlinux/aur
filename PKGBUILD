# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=dapr-cli-bin
pkgver=1.18.0
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64' 'aarch64')
url='https://github.com/dapr/cli'
license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')
source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")
sha256sums_x86_64=('2a94739e0aa101289d88418225319562bc6800db273b3d9cf819a0efd1ea1bfe')
sha256sums_aarch64=('99d93e1dde04225204e2feb33191a1df97c87bb7d88abd10d1523f29a88d35d2')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}