pkgname=minefetch
pkgver=1.6.3
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64" "aarch64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"

source_x86_64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_${pkgver}/minefetch-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('ce494ad6f097e6a3420793b91287766d56e82e048b5fa05786cad2e987f0e7f1')
sha256sums_aarch64=('31f76d715809bf9d14c35c210c7eeeeb8716147055b41b265d39ef3ee202e7c1')

package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}

