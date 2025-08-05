# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dapr-cli-bin
pkgver=1.15.2
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
sha256sums_x86_64=('4680ad905ebe2b709e2139b1bda4e8d7ab1beedd601a4240f92c9e8a4a4296ad'
                   'ea6e52c867bf7cb15cc995d0e90049a20b4d0cbf5ee3a02f4989efbcd22d34d3')
sha256sums_aarch64=('d40248c9183a73104bccf850902a7cae59ba81a27e01bce1490eda2958962bd2'
                    'ebb8d1b8cb9771e53f9bb833f3e72547c1905afb05fb20c10fcdf1089cc195b7')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

