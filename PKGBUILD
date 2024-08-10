# Maintainer: Marco Steiger <marco1steiger (at) gmail (dot) com>
pkgname=warzone2100-sequences
pkgver=3.2.3
pkgrel=3
pkgdesc="Additional video content for Warzone 2100"
url="https://github.com/Warzone2100/wz-sequences"
arch=('any')
license=('GPL')
depends=('warzone2100')
PKGEXT='.pkg.tar'
## You can select the source file of your choice by uncommenting (or leaving uncommented) one of the source-blocks below, keeping/setting all others commented
## Standard quality, english
source=("sequences.wz::https://github.com/Warzone2100/wz-sequences/releases/download/v3/standard-quality-en-sequences.wz")
sha256sums=('142ae905be288cca33357a49f42b884c190e828fc0b1b1773ded5dff774f41a3')
## High quality, english
# source=("sequences.wz::https://github.com/Warzone2100/wz-sequences/releases/download/v3/high-quality-en-sequences.wz")
# sha256sums=('90ff552ca4a70e2537e027e22c5098ea4ed1bc11bb7fc94138c6c941a73d29fa')
## Low quality, english
# source=("sequences.wz::https://github.com/Warzone2100/wz-sequences/releases/download/v3/low-quality-en-sequences.wz")
# sha256sums=('4a1939a1e401f3b0f68736ff19689abed5e1e9d3dfe4fc07b04953c0dfaf7ad6')

noextract=("${source[@]%%::*}")

package() {
  install -Dm644 sequences.wz "${pkgdir}/usr/share/warzone2100/sequences.wz"
}
