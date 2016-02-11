# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
pkgname=warzone2100-sequences
pkgver=1
pkgrel=2
pkgdesc="Additional video content for Warzone 2100"
url="http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/"
arch=('any')
license=('GPL')
depends=('warzone2100')
PKGEXT='.pkg.tar'
## You can select the source file of your choice by uncommenting (or leaving uncommented) one of the source-blocks below, keeping/setting all others commented
## Standard quality, english
source=("sequences.wz::http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/standard-quality-en/sequences.wz/download#")
md5sums=('ab2bbc28cef2a3f2ea3c186e18158acd')
sha512sums=('ca1a1af51296afdaca137114821508c5783f077090e665eae0f6df895855f57c43f84434706309e819417f5f35d1c649bd14e96dc9fbbb1252d30a4f9a223cf6')
## High quality, english
#source=("sequences.wz::http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/high-quality-en/sequences.wz/download#")
#md5sums=('9a1ee8e8e054a0ad5ef5efb63e361bcc')
#sha512sums=('2a4a9e299412fe1adac21001848d10575be69039bb2d762bcad94faefbf498ff72ff0e37fc4017c7598692d250456a444d6d5619c88a9772cfd3a03d4b780f12')
## Low quality, english
#source=("sequences.wz::http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/low-quality-en/sequences.wz/download#")
#md5sums=('6fa4d723d4019552cddf51d7ec8fb78c')
#sha512sums=('d7fab931af53dbdf33d560544984fcb332318c1e122525550c2d5f01ec5726e28d98d8f2905c09959e59fa1fdcbf0986f0fc18f80d016eaaf44938dfef6052d2')
## Standard quality, german
#source=("sequences.wz::http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/standard-quality-de/sequences.wz/download#")
#md5sums=('b1189ce755d94c8f37fc740449662f21')
#sha512sums=('b9188a5ef794ff6a4332eefa77fb24d0d6190228cb1f34f9caad9efcf7afc0471b6cfea12907f4d9decc32f76d6d7e4e18b922d11beeac024c5623a24a25bc66')

noextract=("${source[@]%%::*}")

package() {
  install -Dm644 sequences.wz "${pkgdir}/usr/share/warzone2100/sequences.wz"
}
