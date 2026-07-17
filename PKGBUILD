# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switchy-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="CLI/TUI for restoring CC Switch cloud snapshots from WebDAV or S3"
arch=('x86_64' 'aarch64')
url="https://github.com/ca-x/cc-switchy"
license=('MIT')
options=('!debug')
provides=('cc-switchy')
conflicts=('cc-switchy')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/ca-x/cc-switchy/releases/download/v${pkgver}/cc-switchy-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/ca-x/cc-switchy/releases/download/v${pkgver}/cc-switchy-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('105b921a64c23ce2b8c4c1c8c9f5f48525192d482fdef69e279bb2a4bbccc2e4')
sha256sums_aarch64=('5c84930e805fddeae48514601a46dcf13a2faf3c1ff8b47b6dc18b63d3c9cb0e')

package() {
    install -Dm755 "${srcdir}/cc-switchy" "${pkgdir}/usr/bin/cc-switchy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
