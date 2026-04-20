# Maintainer: czyt <czytcn@gmail.com>
pkgname=autocli-bin
pkgver=0.3.8
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
sha256sums_x86_64=('6ef0f006e70d60af2d8d7d4a44e7d8267c6c5d28540046d7febc851c79045ee1')
sha256sums_aarch64=('9d7c6695aba6e879f586d2052c4f829b7bf7a845cf6f7a12221bbd97e4b7cb09')

package() {
    install -Dm755 autocli "${pkgdir}/usr/bin/autocli"
}
