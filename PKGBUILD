# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools-bin
pkgver=0.7.1
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
source=("https://github.com/g-plane/wasm-language-tools/releases/download/v${pkgver}/wat_server-x86_64-linux.zip"
        "https://raw.githubusercontent.com/g-plane/wasm-language-tools/refs/tags/v${pkgver}/LICENSE")
b2sums=('29aa8389202c30fb5b48b6bea2a0584b2952c523d37f57016c0f80efb8b69b39926b83ed6a8020080046b3ccde85ec2b84abd6ab4e30839bb43e801cba7eda61'
        'b59abf7c7cd2017c87dcdda9c36659525dfba35eaf611cda2a9abfb14d9d106b4cb5c4171f3cb6870625f8be2a161df2a33a312a4c629ed67a8f12dcea829c9e')
provides=('wasm-language-tools')
conflicts=('wasm-language-tools')

package() {
    install -Dm755 "wat_server" "${pkgdir}/usr/bin/wat_server"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
