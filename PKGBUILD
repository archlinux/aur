# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.3.3
pkgrel=1
pkgdesc="Blazing fast, memory-safe CLI tool for fetching information from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/nashsu/AutoCLI"
license=('MIT')
provides=('autocli')
conflicts=('autocli')
install=autocli-bin.install
source_x86_64=("autocli-x86_64-${pkgver}.tar.gz::https://github.com/nashsu/AutoCLI/releases/download/v${pkgver}/autocli-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("autocli-aarch64-${pkgver}.tar.gz::https://github.com/nashsu/AutoCLI/releases/download/v${pkgver}/autocli-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('550924a9aeece68609ce36c622a8670d2bbf21cc90e81a9a0b3e61d33e3503f3')
sha256sums_aarch64=('754e6e4173f30d30d6c1a901fa67fbc6f0f0bbb6b8a3547fc491f30b522baa17')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
