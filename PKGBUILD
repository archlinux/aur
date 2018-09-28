# Maintainer: Marco Steiger <marco1steiger (at) gmail (dot) com>
pkgname=warzone2100-sequences
pkgver=3.2.3
pkgrel=1
pkgdesc="Additional video content for Warzone 2100"
url="http://sourceforge.net/projects/warzone2100/files/warzone2100/Videos/"
arch=('any')
license=('GPL')
depends=('warzone2100')
PKGEXT='.pkg.tar'
## You can select the source file of your choice by uncommenting (or leaving uncommented) one of the source-blocks below, keeping/setting all others commented
## Standard quality, english
source=("sequences.wz::https://netix.dl.sourceforge.net/project/warzone2100/warzone2100/Videos/standard-quality-en/sequences.wz")
sha256sums=('fcab9e860203e7dacda6ee60384da490a9d44aeafc07aa31ff25f9c548be7582')
## High quality, english
#source=("sequences.wz::https://netix.dl.sourceforge.net/project/warzone2100/warzone2100/Videos/high-quality-en/sequences.wz")
#sha256sums=('90ff552ca4a70e2537e027e22c5098ea4ed1bc11bb7fc94138c6c941a73d29fa')
## Low quality, english
#source=("sequences.wz::https://netix.dl.sourceforge.net/project/warzone2100/warzone2100/Videos/low-quality-en/sequences.wz")
#sha256sums=('4a1939a1e401f3b0f68736ff19689abed5e1e9d3dfe4fc07b04953c0dfaf7ad6')
## Standard quality, german
#source=("sequences.wz::https://netix.dl.sourceforge.net/project/warzone2100/warzone2100/Videos/standard-quality-de/sequences.wz")
#sha256sums=('d285c85ffa57a5663ac11073ef954afb97097089306877860e8e9d9119116fd8')

noextract=("${source[@]%%::*}")

package() {
  install -Dm644 sequences.wz "${pkgdir}/usr/share/warzone2100/sequences.wz"
}
