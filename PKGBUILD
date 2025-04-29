pkgname=minefetch
pkgver=1.6.0
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.6.0/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('f9137a5cec919a699e23eb8170588198ea86bbe0f3f156eb1d38c7fa3140c110')
package () {
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
