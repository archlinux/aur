# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.9.0
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
sha256sums_x86_64=('ba6495796a86bc0eaefb9b2d12e73257f35b10bd08e9fd45310d41cc5fee4b61')
sha256sums_aarch64=('79d27f10f51ff5ba663b49df3aa2057a1bcdf37e0055833edcc250dc8e01296e')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
