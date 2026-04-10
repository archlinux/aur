# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="CLI tool and verification framework for spec-driven development"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT' 'Apache-2.0')
provides=('supersigil')
conflicts=('supersigil')
optdepends=('supersigil-lsp-bin: language server for editor integration')
source_x86_64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('cf717963adb250a75d740b98ae392932c4b81beb25c236cbc28c1e3f8e67e394')
sha256sums_aarch64=('07cae9fc18008757bd989111daf045f83af2e2efd685c558d1258f8d11ee650c')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
