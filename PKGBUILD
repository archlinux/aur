# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.3.4
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
sha256sums_x86_64=('817a9f53222a0ba6bc179b32ad6969129d2ccabe3f9b9bb699ba8115f74a7b34')
sha256sums_aarch64=('e486dcfef7f5143881e148306cf2e58c19c3b21acb04f7187471c5f3184cd43a')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
