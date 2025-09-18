# Contributor: Gerald Wu <gerald at geraldwu dot com>
# Maintainer: tee < teeaur at duck dot com >

pkgname=dapr-cli-bin
pkgver=1.16.1
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
sha256sums_x86_64=('89f24f2daeee460c6dd0168fe5e2cdb9c5954adc48438bf51e364f99831ae1ea'
                   'fd07d8856105d826921ae6107aa301f978d614ac2f8a00860797249bae466e4f')
sha256sums_aarch64=('56e890cad046ac24782e69ea8000d51c87a5ff2c218d3f86053110737ddb6f35'
                    'de57005d70341e49361172b1fcdb5f5fe8a7d2fdfaef42465facaee698a8220a')

package() {
    install -Dm755 dapr "$pkgdir/usr/bin/dapr"
}

