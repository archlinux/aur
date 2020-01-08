# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.0
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=("https://github.com/STJr/SRB2/releases/download/SRB2_release_$pkgver/SRB2-v_${pkgver//./}-Installer.exe")
sha256sums=('ae2273baee36188a09bc2f2f549d9ea0ea926890e55ee9cede6e8b8f7c3c4cf0')

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {music,player}.dta {srb2,zones}.pk3 "$pkgdir"/usr/share/games/SRB2
}
