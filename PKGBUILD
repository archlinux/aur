# Maintainer: obselate <obselate@users.noreply.github.com>
pkgname=bntui-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal block explorer for Blocknet privacy blockchain"
arch=('x86_64' 'aarch64')
url="https://github.com/obselate/bntui"
license=('MIT')
depends=()

source_x86_64=("${url}/releases/download/v${pkgver}/bntui-linux-x86_64")
source_aarch64=("${url}/releases/download/v${pkgver}/bntui-linux-aarch64")
sha256sums_x86_64=('6892535c5ae5ea77cd0a14bd62f3dd20639318688b4bff460ea0a283b92a1ad8')
sha256sums_aarch64=('74fb27820188912159279d0f8db3a759dda2e8afe1f46607f0fd781ac845db41')

package() {
    if [[ "$CARCH" == "x86_64" ]]; then
        install -Dm755 "bntui-linux-x86_64" "$pkgdir/usr/bin/bntui"
    elif [[ "$CARCH" == "aarch64" ]]; then
        install -Dm755 "bntui-linux-aarch64" "$pkgdir/usr/bin/bntui"
    fi
}
