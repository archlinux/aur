pkgname=minefetch
pkgver=1.4.0
pkgrel=4
pkgdesc="Download Minecraft mods (In Rust)"
arch=('x86_64')
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.4.0/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('76b8a183ce069b297667afb2dc6f6cbc1921859758f3f84dffcc4b352469bd46')
package () {
  install -Dm 775 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
