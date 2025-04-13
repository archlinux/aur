pkgname=minefetch
pkgver=1.4.2
pkgrel=1
pkgdesc="Download Minecraft mods (In Rust)"
arch=("x86_64")
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/beta_1.4.2/minefetch")
noextract=("${source[@]##*/}")
sha256sums=("c2064322b39e3c5fcdfdad986bbb8ab0b80999a14253aaa5db1bffd36b300057")
package () {
  cd "$srcdir"
  install -Dm 755 "minefetch" "${pkgdir}/usr/bin/minefetch"
  chmod +x minefetch
}
