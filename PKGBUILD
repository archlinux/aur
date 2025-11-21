# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
source=(https://github.com/g-plane/wasm-language-tools/releases/download/v${pkgver}/wat_server-x86_64-linux.zip)
b2sums=('29aa8389202c30fb5b48b6bea2a0584b2952c523d37f57016c0f80efb8b69b39926b83ed6a8020080046b3ccde85ec2b84abd6ab4e30839bb43e801cba7eda61')
provides=('wasm-language-tools')
conflicts=('wasm-language-tools')

package() {
    install -Dm755 "wat_server" "${pkgdir}/usr/bin/wat_server"
}
