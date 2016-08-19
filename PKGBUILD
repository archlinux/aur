# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-commons-bin
pkgver=0.99_1471594578
pkgrel=1

pkgdesc="Common files of Hets"

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-runtime>=7')
provides=('hets-commons')
conflicts=('hets-commons')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-commons-bin-0.99_1471594578-1.tar.gz')
sha256sums=('bd2712280335115c55c2603eae1de176eef29fc8919ed6fd556382215be37689')

package() {
  cp -R usr $pkgdir
}
