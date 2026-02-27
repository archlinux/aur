# Contributor: Gerald Wu <gerald at geraldwu dot com>
    # Maintainer: tee < teeaur at duck dot com >

    pkgname=dapr-cli-bin
    pkgver=1.17.0
    pkgrel=1
    pkgdesc='Command-line tools for Dapr'
    arch=('x86_64' 'aarch64')
    url='https://github.com/dapr/cli'
    license=('Apache-2.0')
    options=('!strip' '!emptydirs')
    provides=('dapr')
    source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
    source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")
    sha256sums_x86_64=('f6331167e5e51c21fb62121a3e7e244e45fa6922bd266abcc9d8a87ccb658e3b')
    sha256sums_aarch64=('09b1e2fbc1e1c977d16077e04b92070cbae97b4539fd07085fcf3644575faa8c')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}