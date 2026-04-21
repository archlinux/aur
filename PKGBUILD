# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.13.0
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
sha256sums_x86_64=('4982f79339fe0e99532a099b0cbe7f2cf2d9d658e8f4243872d7008ce813ea8e')
sha256sums_aarch64=('5dd98a86087db9b83944ba8a51d028921bf329851d91379318cabaf7d7ff2a75')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
