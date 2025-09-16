# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dapr-cli-bin
pkgver=1.16.0
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
sha256sums_x86_64=('e1290d80ec7c20517b38df79725fdff8f489e4f5f47797c0c7b00528dfdcd4ba'
                   'cb259ba97b142016db80e9c71a0e950a092153c18cfc66d80266f3da6aa50b78')
sha256sums_aarch64=('0df2c2da54d757d34dd9563b523fdbd75d7285ae91daaae1ba01fb5a9c726b84'
                    '2e6e62d1059ceee6e391a71c0ffca56ecde1a05d08c519e70bdfe3aceb23bc2a')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

