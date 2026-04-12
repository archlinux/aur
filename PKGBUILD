# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.8.0
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
sha256sums_x86_64=('b440c464bf220e0da988e13c06db730308ff13874791bef6d9cd0b8093431138')
sha256sums_aarch64=('11221ab94fc85505b6cc755be7e89ed542a93dc5f52d22cd8b1a719dd79fc5b5')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
