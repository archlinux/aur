# Maintainer: skyline69 <skyline@noreply.codeberg.org>
pkgname=agcp-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight Rust proxy translating Anthropic Claude API to Google Cloud Code API"
arch=('x86_64' 'aarch64')
url="https://github.com/skyline69/agcp"
license=('MIT')
provides=('agcp')
conflicts=('agcp')

source_x86_64=("${url}/releases/download/v${pkgver}/agcp-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/agcp-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source=("LICENSE-${pkgver}::${url}/raw/v${pkgver}/LICENSE")

sha256sums=('SKIP')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 agcp "${pkgdir}/usr/bin/agcp"
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
