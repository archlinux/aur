# Maintainer: Vinycius <vinycius.florencio@gmail.com>

pkgname=pagbank-cli-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="CLI completa em Rust para as APIs do PagBank"
arch=('x86_64' 'aarch64')
url="https://github.com/vinycalves/pagbank-cli"
license=('MIT')
provides=('pb')
conflicts=('pb')
source_x86_64=("${url}/releases/download/v${pkgver}/pb-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/pb-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b71fb5772150456282d57364b1c010c7261bb4b324233e3968a2598ec7a1a7f4')
sha256sums_aarch64=('bd6d8acf5d9ffc0d2f26f121a64440131d8fb893393e2b6bfa376652bcf44652')

package() {
    install -Dm755 pb "${pkgdir}/usr/bin/pb"
}
