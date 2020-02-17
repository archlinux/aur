# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.1
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=("https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v_${pkgver//./}-Installer.exe")
sha256sums=('5af82508be353dd41b05b793fa7aaef418eab246df7050f72c569f1809b3160f')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {music,player}.dta {srb2,zones}.pk3 "$pkgdir"/usr/share/games/SRB2
}
