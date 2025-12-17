# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools-bin
pkgver=0.7.1
pkgrel=2
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
source=("https://github.com/g-plane/wasm-language-tools/releases/download/v${pkgver}/wat_server-x86_64-linux.zip"
        "https://raw.githubusercontent.com/g-plane/wasm-language-tools/refs/tags/v${pkgver}/LICENSE")
b2sums=('37e073627ae44a0ff784f0039faabe5adcc1237c768b48095c469515bd05eeaad197566fdd9d6912b27309f52df88bb87c8618d7a83ec004175ec0fb3fb7aab8'
        'b59abf7c7cd2017c87dcdda9c36659525dfba35eaf611cda2a9abfb14d9d106b4cb5c4171f3cb6870625f8be2a161df2a33a312a4c629ed67a8f12dcea829c9e')
provides=('wasm-language-tools')
conflicts=('wasm-language-tools')

package() {
    install -Dm755 "wat_server" "${pkgdir}/usr/bin/wat_server"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
