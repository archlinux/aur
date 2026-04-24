# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp-bin
pkgver=0.14.0
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
sha256sums_x86_64=('5515065fbb0d7586db894b2ca6ab7a95a7fc6509f4adefb2a1cb21bb6da03a95')
sha256sums_aarch64=('21a1b2807812e77ac035aff404fcac2053c1b2edc5991fca79d6be8e04dc518b')

package() {
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
