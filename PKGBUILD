# Contributor: Gerald Wu <gerald at geraldwu dot com>
    # Maintainer: tee < teeaur at duck dot com >

    pkgname=dapr-cli-bin
    pkgver=1.17.1
    pkgrel=1
    pkgdesc='Command-line tools for Dapr'
    arch=('x86_64' 'aarch64')
    url='https://github.com/dapr/cli'
    license=('Apache-2.0')
    options=('!strip' '!emptydirs')
    provides=('dapr')
    source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
    source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz")
    sha256sums_x86_64=('a2ce17223d23e1a3651b8ccd9d0e619638db5b760b52fbc4e4d21e8571c6999e')
    sha256sums_aarch64=('1ec4dd07c3f70810931ce140d67ad0d28261a508c6c5474fcc381001ae392b88')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}