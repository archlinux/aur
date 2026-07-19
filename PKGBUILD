# Maintainer: Adam Wahab <awahab@adhoc.tools>
_name=soundshed-guitar
pkgname=${_name,,}
pkgver=1.4.0
pkgrel=1
pkgdesc="A guitar/bass effects app and plugin."
arch=(x86_64)
url="https://guitar.soundshed.com"
license=(AGPL-3.0)
depends=(webkit2gtk-4.1)
makedepends=('unzip')
options=()
source=("https://downloads.soundshed.com/downloads/SoundshedGuitar-${pkgver}-Linux-x64.zip")
sha256sums=('5359afc2c1201fc351c8a61c2eba549f661f4c4e3402a11f7365e4266c11af2d')

package() {
  rm SoundshedGuitar-${pkgver}-Linux-x64.zip
  cp -a "$srcdir" "$pkgdir"
}
