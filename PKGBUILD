# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-data
pkgver=2.1.25
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=("https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v${pkgver//./}-Installer.exe")
sha256sums=('a2f851685dcd7f34fdc53ef3239dd63023231ba3a83c1fdfb01df556b37fe6d9')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {music,player,rings,zones}.dta srb2.srb "$pkgdir"/usr/share/games/SRB2
}
