# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=damas
pkgver=0.1.6
pkgrel=1
pkgdesc="Checkers game: CLI, TUI and embedded web server in one binary"
arch=('x86_64' 'aarch64')
url="https://github.com/vmvarela/damas"
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}")

source=("LICENSE::https://raw.githubusercontent.com/vmvarela/damas/v${pkgver}/LICENSE")
sha256sums=('17c9a39ccf9ca5789ef8f5317af6990e30d65dedc9a0b09f2fb8f2035fd9ca0f')

source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/vmvarela/damas/releases/download/v${pkgver}/damas-x86_64-linux")
sha256sums_x86_64=('e9d4da61454bfbb25e121997804cb947fa56a1b08d0aacb7b2f67c24dddbf940')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/damas/releases/download/v${pkgver}/damas-aarch64-linux")
sha256sums_aarch64=('9677af813d4a46d655727eea063a587bfbd42ba3de0faf4785549a13144e18d4')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
