# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.4.0
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
sha256sums_x86_64=('e952ad1a87c5aefd65b0614860c1f9728dfd7346073ec75c7bc2bd5d810f3ea7')
sha256sums_aarch64=('32a995c5ac6c129f3b8f83a00406441d2359f7c39f53ad2b6b1fc56cc1853614')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
