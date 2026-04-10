# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.3.7
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
sha256sums_x86_64=('77de20256606566297882add560c7e34cf66bd7e5b1916a6e3ff5643e5e7249d')
sha256sums_aarch64=('ab17e9aa02a9638cd93adfa6545f4da4acf4e01ddd738aafa83f9ffc87e0a8a1')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
