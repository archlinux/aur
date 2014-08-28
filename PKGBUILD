# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>

pkgname=srb2-data
pkgver=2.1.11
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=("http://rosenthalcastle.org/srb2/SRB2-v${pkgver//./}-Installer.exe")
sha256sums=('34782e945edf7e35efb54003ce9a809459eb056072df3f9dd3d72610014af5d3')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {music,player,rings,zones}.dta srb2.srb "$pkgdir"/usr/share/games/SRB2
}
