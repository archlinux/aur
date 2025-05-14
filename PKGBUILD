pkgname=minefetch
pkgver=1.6.4
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64" "aarch64")
license=('GPL-3.0-or-later')
url="https://github.com/KirillkoTankisto/minefetch"

source_x86_64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('85d2bee865ab6d2d8f947677dd525885a64100a0e39d9b077f4f6d775b80c7d2')
sha256sums_aarch64=('7cc7a6356a02da4cff5110336e9076882fdfdb5df3a0dc2f8b359e4487a4d063')

package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}

