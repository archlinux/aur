pkgname=minefetch
pkgver=1.4.1
pkgrel=5
pkgdesc="Download Minecraft mods (In Rust)"
arch=('x86_64')
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.4.1/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('969829847819ce796dd48968455133bdc4bc486e31505fd0a7ab7a0e341781c1')
package () {
  install -Dm 775 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
