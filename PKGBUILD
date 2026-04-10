# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool and verification framework for spec-driven development"
arch=('x86_64' 'aarch64')
url="https://github.com/jonisavo/supersigil"
license=('MIT')
provides=('supersigil')
conflicts=('supersigil')
source_x86_64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/supersigil-${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('85e4c1e16684c3f2eb5cbfd3277e1d82b03dff14eb5a60d271e3e09b7059100c')
sha256sums_aarch64=('87f12a9b5b16ac5d30add8e67e42627a20618a7946771d486d3faad6c6a363d5')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
