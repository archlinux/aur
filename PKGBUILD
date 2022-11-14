# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.6
pkgrel=2
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/AssetsLinuxOnly.zip")
sha256sums=('7a384fb99d42f0cf41d12e3ed873754f9a5ba2b993d5e54bde7962bea3accdd1')

package() {
	install -d "$pkgdir"/usr/share/games/SRB2Kart
	install -m644 mdls.dat {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb "$pkgdir"/usr/share/games/SRB2Kart
	cp -r mdls "$pkgdir"/usr/share/games/SRB2Kart/mdls
}
