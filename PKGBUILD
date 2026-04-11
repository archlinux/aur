# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Language server for Supersigil spec documents (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT' 'Apache-2.0')
provides=('supersigil-lsp')
conflicts=('supersigil-lsp')
options=(!debug)
source_x86_64=("${url}/releases/download/v${pkgver}/supersigil-lsp-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/supersigil-lsp-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('fa23b42bfa8ed09835e7646842ca46db7804a15709977969525de6bf79ce9eba')
sha256sums_aarch64=('04b7d0b035e82bf889d4e82e3597fa45bf08987bc5fa8d0ce61c435a73fc9cc6')

package() {
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
