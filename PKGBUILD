# Maintainer: vmvarela <vmvarela@gmail.com>
pkgname=damas
pkgver=0.1.3
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
sha256sums_x86_64=('a0be0044d7f0e388f6b2868c8b9de906389cd370d6341b5ede11c2102cab049c')

source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/vmvarela/damas/releases/download/v${pkgver}/damas-aarch64-linux")
sha256sums_aarch64=('c2e49cdb8f1861f2cb659486f7d09aa103d79033fb22a2392d9d240d66c1de94')

package() {
    install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
