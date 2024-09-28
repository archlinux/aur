# Maintainer: PASRC <pasrc at proton dot me>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-legacy-data
pkgver=2.1.25
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2 2.1 (srb2-legacy specific install directory)"
arch=('any')
license=('custom')
url='http://www.srb2.org'
optdepends=('srb2-legacy: "Sonic Robo Blast 2" game, srb2-legacy fork')
source=("https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v${pkgver//./}-Installer.exe")
sha256sums=('a2f851685dcd7f34fdc53ef3239dd63023231ba3a83c1fdfb01df556b37fe6d9')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2legacy
  install -m644 {music,player,rings,zones,patch}.dta srb2.srb "$pkgdir"/usr/share/games/SRB2legacy
}
