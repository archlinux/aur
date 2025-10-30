# Contributor: Gerald Wu <gerald at geraldwu dot com>
    # Maintainer: tee < teeaur at duck dot com >

    pkgname=dapr-cli-bin
    pkgver=1.16.2
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
sha256sums_x86_64=('b8fbec8b86f0d3d0869db365d819912b48e78ea1a08f46e9d41104cad62f8f52'
                   'd2aef70510d54e79c35f9548ab4d3fb948fc175f8c9a564043559f10ded8adcb')
sha256sums_aarch64=('737d7025c6b745f4b1bb73ab9a15ac4b3c312d82290402138aefc2215684fef2'
                    'ec0130bc2a55e9e4fe9306946717750dbd83843e09e9dd7c25acc1720552d5e5')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

