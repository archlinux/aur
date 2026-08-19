# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >
# Contributor: Juan Francisco Miranda <aurarchlinux.sleek355 at passfwd dot com>

pkgname=dapr-cli-bin
pkgver=1.18.1
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64' 'aarch64')
url='https://github.com/dapr/cli'
license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')
source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")
sha256sums_x86_64=('025026626ddd40004273a1f5cac4eb53dfe6979e624c1c083531f483403ed3f1')
sha256sums_aarch64=('fbe1a29e17c7553ae43ec2090b8d28ee98a485628b27ac2219880183bf49ebe6')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}