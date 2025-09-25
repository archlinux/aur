# Maintainer : MorsMortium <morsmortium@disroot.org>

pkgname=pysolfc-music
pkgver=4.50
pkgrel=2
url="https://pysolfc.sourceforge.io/"
pkgdesc="Music for PySol Fan Club Edition"
arch=('any')
license=('GPL-3.0-or-later')
conflicts=('pysolfc-music')
depends=('pysolfc')
source=("https://github.com/shlomif/pysol-music/archive/refs/tags/4.50.tar.gz")
sha1sums=('85151a633abc3094ec9cc8348ef4fe2c197898c7')

package() {
  cd pysol-music-4.50/data/music
  mkdir -p ${pkgdir}/usr/share/PySolFC/music
  install -Dm 644 ./* ${pkgdir}/usr/share/PySolFC/music
}
