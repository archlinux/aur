# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.0.3
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('GPL')
url='https://mb.srb2.org/showthread.php?t=43708'
optdepends=('srb2kart: "Sonic Robo Blast 2 Kart" game')
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${pkgver//./}-Installer.exe")
sha256sums=('5ca2221825cfc3f44574644fd0b6434fa987f3a728114974c35767cafbd44947')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2Kart
  install -m644 {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb "$pkgdir"/usr/share/games/SRB2Kart
}