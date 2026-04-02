# Maintainer: czyt <czytcn@gmail.com>
pkgname=opencli-rs-bin
pkgver=0.2.3
pkgrel=3
pkgdesc="Blazing fast, memory-safe CLI tool to fetch information from websites with a single command"
arch=('x86_64' 'aarch64')
url="https://github.com/nashsu/opencli-rs"
license=('Apache-2.0')
provides=('opencli-rs')
conflicts=('opencli-rs')
install="${pkgname}.install"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/nashsu/opencli-rs/releases/download/v${pkgver}/opencli-rs-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/nashsu/opencli-rs/releases/download/v${pkgver}/opencli-rs-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('f7f1c8dbbe77fcfa815a16285908e19b61b69cb293fca5fd4dd382cd7807d575')
sha256sums_aarch64=('ddf2ec9e567646b8aa9456fdda490824603edec9536502910f63dc83e638320b')

package() {
  install -Dm755 "${srcdir}/opencli-rs" "${pkgdir}/usr/bin/opencli-rs"
}
