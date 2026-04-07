# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.2.4
pkgrel=2
pkgdesc="Blazing fast, memory-safe CLI tool for fetching information from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/nashsu/AutoCLI"
license=('MIT')
provides=('autocli')
conflicts=('autocli')
install=autocli-bin.install
source_x86_64=("autocli-x86_64-${pkgver}.tar.gz::https://github.com/nashsu/AutoCLI/releases/download/v${pkgver}/autocli-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("autocli-aarch64-${pkgver}.tar.gz::https://github.com/nashsu/AutoCLI/releases/download/v${pkgver}/autocli-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('3f10b3161df15c7003821d614bb1e721ef55c517105baf7835a08ee73b7cfe2c')
sha256sums_aarch64=('3ca021fde465042a304cb5a920ad4c7ee2097bacfbcd5f6d123ffefa2b2fe3dc')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
