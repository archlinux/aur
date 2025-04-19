pkgname=minefetch
pkgver=1.5.1
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.5.1/minefetch")
noextract=("${source[@]##*/}")
sha256sums=("60eb1ca4dcdc367319303459dad6476ad630928ae2d5a8cceb69894a321781c4")
package () {
  cd "$srcdir"
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
  chmod +x minefetch
}
