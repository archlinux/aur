# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp-bin
pkgver=0.6.0
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
sha256sums_x86_64=('95aa5062cdf651e33a3c31eb01e4c44b8fabcb64f31d52047ef6b3319747b95a')
sha256sums_aarch64=('c5a1113516bf52fbaf17f8f225c60046dee8d4273f2e5daf56b8716bd416b212')

package() {
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
