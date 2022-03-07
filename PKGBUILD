# Maintainer : MorsMortium <morsmortium@gmail.com>

pkgname=pysolfc-music
pkgver=4.5
pkgrel=1
url="https://pysolfc.sourceforge.io/"
pkgdesc="Music for PySol Fan Club Edition"
arch=('any')
license=('GPL3')
depends=('pysolfc')
source=("https://deac-ams.dl.sourceforge.net/project/pysolfc/PySol-Music/PySol-Music-4.50/pysol-music-4.50.tar.xz")
sha512sums=('SKIP')

package() {
  cd pysol-music-4.50/data/music
  mkdir -p ${pkgdir}/usr/share/PySolFC/music
  install -Dm 644 ./* ${pkgdir}/usr/share/PySolFC/music
}
