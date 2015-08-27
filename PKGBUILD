# Maintainer: Andrey Vihrov <andrey.vihrov at gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=quake3-rally
pkgver=0.0.0.3
pkgrel=1
epoch=1
pkgdesc="A car driving and car combat mod for Quake III Arena/OpenArena"
arch=('any')
url="http://www.moddb.com/mods/quake-3-rally"
license=('GPL2')
depends=('quake3')
source=("http://media1.gamefront.com/moddb/2014/11/25/q3rally_v0003.zip")
sha256sums=('a8b1cb8fdbeee9a266166eb82b5d6bd30305f8e1bd4ffa5735091e5cae374c27')

package() {
  cd "Q3Rally"

  # Remove unneeded files
  rm baseq3r/*.dll

  # Copy mod files
  mkdir -p "${pkgdir}/opt/quake3"
  cp -dR baseq3r "${pkgdir}/opt/quake3"
}

# vim:set ts=2 sw=2 et:
