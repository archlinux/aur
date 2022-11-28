# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=dapr-cli-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64')
url='https://github.com/dapr/cli'
license=('Apache')
options=('!strip' '!emptydirs')
source=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
sha256sums=('f08c4b9dad4f28af187ab0f3c5f3ea162585d734ea086ee67d7f78f87458dddd')
provides=('dapr')

package() {
    install -Dm755 "dapr" "$pkgdir/usr/bin/dapr"
}

