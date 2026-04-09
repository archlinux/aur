pkgname=minefetch
pkgver=1.6.10
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64" "aarch64")
license=('GPL-3.0-or-later')
url="https://github.com/KirillkoTankisto/minefetch"

source_x86_64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('7fa02e74c524d767073cd1aa22b273da9bab8a9cd3973d0c9deaac1e549c3342')
sha256sums_aarch64=('ff510c6107f5f8950f924633856eda8066941360c99bd6668c4ff0c59990ccc5')

package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}

