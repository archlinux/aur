# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.9
pkgver_1=v229
pkgrel=3
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-${pkgver_1}-Full.zip"
)
sha256sums=('48e644604bed81b5ce6b12ef23a2f4042d0118d0ba70f18c534dfe86ebe6f37d')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 models.dat {player,music}.dta {srb2,zones,patch_music,patch}.pk3 "$pkgdir"/usr/share/games/SRB2
  cp -r models "$pkgdir"/usr/share/games/SRB2/models
}
