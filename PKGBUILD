# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK
# Contributor: DilithiumNitrate

pkgname=srb2-data
pkgver=2.2.10
pkgver_1=v2210
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_${pkgver}/SRB2-${pkgver_1}-Full.zip"
)
sha256sums=('e69ac5cacc86f85eeaba14644a37cad932f7d7031b667892d2f9ba9bfb437d25')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 models.dat {player,music}.dta {srb2,zones}.pk3 "$pkgdir"/usr/share/games/SRB2
  cp -r models "$pkgdir"/usr/share/games/SRB2/models
}
