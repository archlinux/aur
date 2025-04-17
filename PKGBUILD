pkgname=minefetch
pkgver=1.5.0
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.5.0/minefetch")
noextract=("${source[@]##*/}")
sha256sums=("56f5ebe512394920e1ef18e3408a1ef4065ca5b0cc7ead1f52074cbf4fdd17ed")
package () {
  cd "$srcdir"
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
  chmod +x minefetch
}
