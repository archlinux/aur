# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switchy-bin
pkgver=0.4.1
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
sha256sums_x86_64=('7a193c33f19aa92377b628d61db4f3d3d693384736fcb0ca36f5e53b93a49f69')
sha256sums_aarch64=('911e0043599ceed1b94ac255dcec5eb25811919a1d546d5ccec7170e338f7ab8')

package() {
    install -Dm755 "${srcdir}/cc-switchy" "${pkgdir}/usr/bin/cc-switchy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
