pkgname=minefetch
pkgver=1.5.2
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.5.2/minefetch")
noextract=("${source[@]##*/}")
sha256sums=("d3202115eed7cdea6fd92631399d47bb7c8ba6deebdbb23da94cbb69ce1b8862")
package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
