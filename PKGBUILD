# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.11.0
pkgrel=1
pkgdesc="CLI tool and verification framework for spec-driven development (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT' 'Apache-2.0')
provides=('supersigil')
conflicts=('supersigil')
options=(!debug)
optdepends=('supersigil-lsp-bin: language server for editor integration')
source_x86_64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('7bdecc27e2db9187c9625af820264e924f3c6e6d55e85c6f7113b47ba95e9264')
sha256sums_aarch64=('aa3a7a9a42eaa8396ecf5248396633a2d6f654b55cd70094926f2a2d41a330bc')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
