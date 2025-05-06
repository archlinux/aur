pkgname=minefetch
pkgver=1.6.2
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64" "aarch64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"

source_x86_64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.6.2/minefetch-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.6.2/minefetch-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('cfa8f8482a8b567f4abc884518718219257dfd43a5fb1975f529a5db10579525')
sha256sums_aarch64=('782e3e2b1d6da905edf63a0e4cbdd468d788dbdac7eb7fa1a047badca5fa9797')

package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}

