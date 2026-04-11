# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp-bin
pkgver=0.5.0
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
sha256sums_x86_64=('7dc113429c9dcaefd5c87aefe457adabb029cb78459a495ea21f724c30490e85')
sha256sums_aarch64=('107c2146b8e08b00d7dfed9431f4d346f7d92dc5346299b331dc654f213acb46')

package() {
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
