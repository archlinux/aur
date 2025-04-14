pkgname=minefetch
pkgver=1.4.3
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.4.3/minefetch")
noextract=("${source[@]##*/}")
sha256sums=("c1d2ef7ae30f04abdae5c57daae879a88665b5df16491ec6658a6e9c22951429")
package () {
  cd "$srcdir"
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
  chmod +x minefetch
}
