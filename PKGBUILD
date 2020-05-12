# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: DeedleFake <yisszev at beckforce dot com>
# Contributor: JJK

pkgname=srb2-data
pkgver=2.2.4
instver=2.2.1
pkgrel=1
pkgdesc="Data files for Sonic Robo Blast 2"
arch=('any')
license=('GPL')
url='http://www.srb2.org'
optdepends=('srb2: "Sonic Robo Blast 2" game')
source=(
    "https://github.com/STJr/SRB2/releases/download/SRB2_release_$instver/SRB2-v_${instver//./}-Installer.exe"
    "https://files.srb2.org/srb2.org/SRB2-v${pkgver//./}-Patch.zip"
)
sha256sums=(
    "5af82508be353dd41b05b793fa7aaef418eab246df7050f72c569f1809b3160f"
    "8f384643a226041ebd7fed5e4d1e610ffba9da36dc34f51a50d9461d768f6750"
)

package() {
  install -d "$pkgdir"/usr/share/games/SRB2
  install -m644 {player,music}.dta {srb2,zones,patch_music,patch}.pk3 "$pkgdir"/usr/share/games/SRB2
}
