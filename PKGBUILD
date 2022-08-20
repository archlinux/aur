# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.4
pkgrel=3
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${pkgver//./}-Data.zip")
sha256sums=('4a5c1b697377ecbf5c2ad6d4e8c02f8513f5c2b75324316ec8f467f5069cd4ae')

package() {
	install -d "$pkgdir"/usr/share/games/SRB2Kart
	install -m644 mdls.dat {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb "$pkgdir"/usr/share/games/SRB2Kart
	cp -r mdls "$pkgdir"/usr/share/games/SRB2Kart/mdls
}
