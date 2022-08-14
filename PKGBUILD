# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=pysolfc-music
pkgver=4.5
pkgrel=2
url="https://pysolfc.sourceforge.io/"
pkgdesc="Music for PySol Fan Club Edition"
arch=('any')
license=('GPL3')
depends=('pysolfc')
source=("https://github.com/shlomif/pysol-music/archive/refs/tags/4.50.tar.gz")
sha512sums=('SKIP')

package() {
  cd pysol-music-4.50/data/music
  mkdir -p ${pkgdir}/usr/share/PySolFC/music
  install -Dm 644 ./* ${pkgdir}/usr/share/PySolFC/music
}
