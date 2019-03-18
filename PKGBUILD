# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.0.4
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
optdepends=('srb2kart: "Sonic Robo Blast 2 Kart" game')
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${pkgver//./}-Installer.exe")
sha256sums=('e69e59381ca71ced0f14a180b9e900a235f1fb5d30ee09692be1f2cc381c3d5e')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2Kart
  install -m644 {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb "$pkgdir"/usr/share/games/SRB2Kart
}