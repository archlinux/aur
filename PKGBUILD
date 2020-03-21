# Maintainer: Milkii Brewster <milkii on Freenode IRC>
pkgname=omnifono.lv2
pkgdesc="Utility mixer LV2 plugin."
pkgver=0.0.1
pkgrel=1
epoch=
arch=(x86_64)
url="http://intonarumori.sourceforge.net/omnifono.html"
license=(GPL)
groups=(lv2-plugins)
depends=(lv2)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(omnifono.lv2::https://sourceforge.net/projects/intonarumori/files/Omnifono/Omnifono-0.1-Src+32-64builds.tar.bz2)
md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir"/usr/lib/lv2
  mv 64bit_build/Omnifono.lv2 "$pkgdir/usr/lib/lv2"
}
