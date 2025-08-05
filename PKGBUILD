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
sha256sums_x86_64=('09328bc0e4353036b824c2ec9cf7cabf4d75b4fc00ca02d80ae3e4374ee27eda'
                   '49a4270d1b2af32aab3589a7ffa739a8589d6e7399e2c44d82eef30bd3e583cc')
sha256sums_aarch64=('b49244701a191c1e843211383703be9f2cd086a1db259c9789672f7e4e82ad55'
                    'a108fa896b5c1c44808e4669f002cb30803cbf226b63e96987f033114877b59a')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

