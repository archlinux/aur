# Maintainer: czyt <czytcn@gmail.com>
pkgname=cc-switchy-bin
pkgver=0.5.1
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
sha256sums_x86_64=('83333b73772dbc36609a545f4ff686d0150b09b46e01d8398d6f2a0ff31c867c')
sha256sums_aarch64=('ae3aec01d5f322993aa688e08ecbe551c42e42578cb28cdbb01103f735613463')

package() {
    install -Dm755 "${srcdir}/cc-switchy" "${pkgdir}/usr/bin/cc-switchy"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/THIRD_PARTY_NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_NOTICES.md"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
