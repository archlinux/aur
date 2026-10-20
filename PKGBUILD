# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=damas
pkgver=0.1.10
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
sha256sums_x86_64=('ec3b3e2853e5f3f561c6b803c38f4c153db46ee8877daad2f36a91841656fd9a')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/damas/releases/download/v${pkgver}/damas-aarch64-linux")
sha256sums_aarch64=('7a9295b693862b39cdd8285fe34f5ff643dd61f80d797665c5622db1216b0d20')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
