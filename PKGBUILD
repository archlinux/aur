# Contributor: Gerald Wu <gerald at geraldwu dot com>
    # Maintainer: tee < teeaur at duck dot com >

    pkgname=dapr-cli-bin
    pkgver=1.16.3
    pkgrel=1
    pkgdesc='Command-line tools for Dapr'
    arch=('x86_64' 'aarch64')
    url='https://github.com/dapr/cli'
    license=('Apache-2.0')
options=('!strip' '!emptydirs')
provides=('dapr')
source_x86_64=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz"
"dapr-cli-$pkgver-linux-amd64.tar.gz.sha256::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz.sha256")
source_aarch64=("dapr-cli-$pkgver-linux-arm64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz"
"dapr-cli-$pkgver-linux-arm64.tar.gz.sha256::${url}/releases/download/v${pkgver}/dapr_linux_arm64.tar.gz.sha256")
sha256sums_x86_64=('87c0248cbb902c4454fb4d9bf073c64f3fb2ea77359903ebc0a58ecd3e30de1b'
                   '7d30db4612b603062ec9568eb697124abba1f5cfc272bde8ec164ae0b8d69e45')
sha256sums_aarch64=('50bf5be69d99d034a0c92b53dd9cef86b8d9333cd2a89e04ff833db46e015b25'
                    '232d6da5c4305accfa045812ac795b1668059626bdee3f1744a0bc23036a9a47')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

