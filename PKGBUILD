# Maintainer: steeltitanium <steeltitanium1 at gmail dot com>
# Contributor: steeltitanium <steeltitanium1 at gmail dot com>

pkgname=srb2kart-data
pkgver=1.5
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 Kart"
arch=('any')
license=('custom')
url='https://mb.srb2.org/showthread.php?t=43708'
source=("https://github.com/STJr/Kart-Public/releases/download/v$pkgver/AssetsLinuxOnly.zip")
sha256sums=('0381e4c670c64080ae72c2721d761ce460916cc3f4338363adea218453906ab0')

package() {
	install -d "$pkgdir"/usr/share/games/SRB2Kart
	install -m644 mdls.dat {music,textures,gfx,maps,sounds,chars,bonuschars}.kart srb2.srb "$pkgdir"/usr/share/games/SRB2Kart
	cp -r mdls "$pkgdir"/usr/share/games/SRB2Kart/mdls
}
