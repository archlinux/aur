pkgname=minefetch
pkgver=1.3.1
pkgrel=3
pkgdesc="Download Minecraft mods (In Rust)"
arch=('x86_64')
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.3.1/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('87d76e6d90fc8f97ff69b538b1481c79fcf8905d6b4c1ccf910dfdcc60d8602e')
package () {
  install -Dm 775 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
