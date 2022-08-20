# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.4
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/srb2kart-v${pkgver//./}-Data.zip")
sha256sums=('82a4a68fa2ebc10f3bdbb8257411200d13f6e185e22306dca14b6158578d8466')

package() {
	install -d "$pkgdir"/usr/share/games/SRB2Kart
	install -d "$pkgdir"/usr/share/games/SRB2Kart/mdls
	install -m644 {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb mdls.dat "$pkgdir"/usr/share/games/SRB2Kart
	cp -dpr --no-preserve=ownership mdls "$pkgdir"/usr/share/games/SRB2Kart
}
