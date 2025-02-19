pkgname=minefetch
pkgver=1.3.0
pkgrel=2
pkgdesc="Download Minecraft mods (In Rust)"
arch=('x86_64')
license=('GPL')
url="https://github.com/KirillkoTankisto/minefetch"
source=("https://github.com/KirillkoTankisto/minefetch/releases/download/alpha_1.3.0/minefetch")
noextract=("${source[@]##*/}")
sha256sums=('c04431f8f5e546fd1133271d73c4dfb17bad61ec65b75d8899d9932a2b897bec')
package () {
  install -Dm 775 "minefetch" "${pkgdir}/usr/bin/minefetch"
}
