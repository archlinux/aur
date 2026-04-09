# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.3.6
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
sha256sums_x86_64=('49702d4a49190466975895ca918ce36efa88ac151ddb30efc70a2deaa0e75ae2')
sha256sums_aarch64=('95b0c9c8827d00d6d5565a8de41508ffa2cbd840715769f365482c4355d05c28')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
