# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.9
pkgver_1=v229
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-${pkgver_1}-Full.zip"
)
sha256sums=('48cf787a70f44b31fa7a56db4053a404a7103a494f1e09fd2bbfd563672a3534')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {player,music}.dta {srb2,zones,patch_music,patch}.pk3 "$pkgdir"/usr/share/games/SRB2
  cp -r models "$pkgdir"/usr/share/games/SRB2/models
}
