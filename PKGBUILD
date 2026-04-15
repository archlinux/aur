# Maintainer: Joni Savolainen <joni@savolainen.io>
pkgname=supersigil-lsp-bin
pkgver=0.11.0
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
sha256sums_x86_64=('a113c61a3a7589adb123088428f872b26e076586f02cd16685c1207328315a0f')
sha256sums_aarch64=('2d7d74fdecdff04e32521fd9f90318e089d284366f2236fdca8f7ab680c45a6b')

package() {
    install -Dm755 supersigil-lsp "${pkgdir}/usr/bin/supersigil-lsp"
}
