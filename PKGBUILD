# Maintainer: Vinycius <vinycius.florencio@gmail.com>

pkgname=pagbank-cli-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI completa em Rust para as APIs do PagBank"
arch=('x86_64' 'aarch64')
url="https://github.com/vinycalves/pagbank-cli"
license=('MIT')
provides=('pb')
conflicts=('pb')
source_x86_64=("${url}/releases/download/v${pkgver}/pb-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/pb-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('d6c1bf93850b685d8dbcdfd72932651afa397c8e8f004362721d2d5a1e76acad')
sha256sums_aarch64=('93bc305e4d95e5c895c1c315aaefd49679a81c3144ae687f3b65dec028adbe89')

package() {
    install -Dm755 pb "${pkgdir}/usr/bin/pb"
}
