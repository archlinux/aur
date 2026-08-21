# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=dapr-cli-bin
pkgver=1.18.2
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64' 'aarch64')
url='https://github.com/dapr/cli'
license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')

source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")

sha256sums_x86_64=('ccfff008fd16f50096a9192ad56697ac7052e3add6fa0a07789d87b4c4df8c40')
sha256sums_aarch64=('356e40cffc3ee4ebaa0396edde31a6e33bc0351162a6a9ea98550baebb8d039f')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}