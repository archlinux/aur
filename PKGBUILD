# Maintainer: Lukas Hertel <dev@lukas-hertel.de>
# Maintainer: Quentin Michaud <mh4ckt3mh4ckt1c4s@archlinux.org>

pkgname=wasm-language-tools-bin
pkgver=0.10.1
pkgrel=1
pkgdesc="Language server and other tools for WebAssembly"
arch=('x86_64')
url="https://github.com/g-plane/wasm-language-tools"
license=('MIT')
source=("https://github.com/g-plane/wasm-language-tools/releases/download/v${pkgver}/wat_server-x86_64-linux.zip"
        "https://raw.githubusercontent.com/g-plane/wasm-language-tools/refs/tags/v${pkgver}/LICENSE")
b2sums=('1d11b265b0f237eb8e65bf355a8057de060f9f4cf89e4d8e86ed4cd50591e985227b2dd43a1d7d038227873c24787f80de881ccb114ca53f4f6c4ec7dd5c6f6f'
        'b59abf7c7cd2017c87dcdda9c36659525dfba35eaf611cda2a9abfb14d9d106b4cb5c4171f3cb6870625f8be2a161df2a33a312a4c629ed67a8f12dcea829c9e')
provides=('wasm-language-tools')
conflicts=('wasm-language-tools')

package() {
    install -Dm755 "wat_server" "${pkgdir}/usr/bin/wat_server"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
