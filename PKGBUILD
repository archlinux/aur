# Maintainer: Gerald Wu <gerald at geraldwu dot com>

pkgname=dapr-cli-bin
pkgver=1.10.0
pkgrel=1
pkgdesc='Command-line tools for Dapr'
arch=('x86_64')
url='https://github.com/dapr/cli'
license=('Apache')
options=('!strip' '!emptydirs')
source=("dapr-cli-$pkgver-linux-amd64.tar.gz::${url}/releases/download/v${pkgver}/dapr_linux_amd64.tar.gz")
sha256sums=('48063b751a08f4e311c56c4930cfec48bc25be62ceb61bf6691300a0b9729f61')
provides=('dapr')

package() {
    install -Dm755 "dapr" "$pkgdir/usr/bin/dapr"
}

