# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
pkgname=warzone2100-sequences
pkgver=1
pkgrel=1
pkgdesc="Additional video content for Warzone 2100"
url="http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/"
arch=('any')
license=('GPL')
depends=('warzone2100')
PKGEXT='.pkg.tar'
source=("sequences.wz::http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/standard-quality-en/sequences.wz/download#")
noextract=("${source[@]%%::*}")
md5sums=('ab2bbc28cef2a3f2ea3c186e18158acd')
sha512sums=('ca1a1af51296afdaca137114821508c5783f077090e665eae0f6df895855f57c43f84434706309e819417f5f35d1c649bd14e96dc9fbbb1252d30a4f9a223cf6')

package() {
  install -Dm644 sequences.wz "${pkgdir}/usr/share/warzone2100/sequences.wz"
}
