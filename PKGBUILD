pkgname=minefetch
pkgver=1.6.4
pkgrel=2
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64" "aarch64")
license=('GPL-3.0-or-later')
url="https://github.com/KirillkoTankisto/minefetch"

source_x86_64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('03afe2d77b42083f0214b05a2505982143997a3a07db5a6b3df4021a5fa9e460')
sha256sums_aarch64=('4bf5c88b9067f03aa1243d417be59b89b711d4b0ccdecd4f943612e62c80a889')

package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}

