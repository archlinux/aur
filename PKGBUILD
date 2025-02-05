pkgname=minefetch
pkgver=1.2.2
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=('x86_64')
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/alpha_1.2.2/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('a368e16bd6000aa7199efeb4b2c745b47cc35a87183bb19454561faeb3c325b0')
package () {
  install -Dm 775 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
