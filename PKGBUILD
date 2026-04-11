# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-bin
pkgver=0.3.0
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
sha256sums_x86_64=('1c91bb79c7440f9c420fa09380b2fa1ee34fe9f6e74fe1b5e0a19b9c30f6075b')
sha256sums_aarch64=('7c74ba731e8a3328b09718437c25da22fde6106c3299c487d89a48899e2978bc')

package() {
    install -Dm755 supersigil "${pkgdir}/usr/bin/supersigil"
}
