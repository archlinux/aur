# Maintainer: Cleboost <clement.balarot@gmail.com>

pkgname=temper-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A stupidly fast open-source Minecraft server, written in Rust (binary version)"
arch=('x86_64' 'aarch64')
url="https://github.com/temper-mc/temper"
license=('GPL3')
conflicts=("temper")
provides=("temper")
options=(!strip)

source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/temper-mc/temper/releases/download/v${pkgver}/temper-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/temper-mc/temper/releases/download/v${pkgver}/temper-aarch64-unknown-linux-gnu.tar.gz")

sha256sums_x86_64=('0ee1d07002f95ad1266dea02795114af9c8d94fea70a28e6c342dedf0bb0af06')
sha256sums_aarch64=('a83545dd862fc2217c770aa2ed7fc30ac1357688de9d3fdafc043b50f5e847e5')

package() {
    install -Dm755 "${srcdir}/temper" "${pkgdir}/usr/bin/temper"
}
