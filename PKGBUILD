# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-commons-bin
pkgver=0.99_1472225208
pkgrel=1

pkgdesc="Common files of Hets"

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-runtime>=7')
provides=('hets-commons')
conflicts=('hets-commons')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-commons-bin-0.99_1472225208-1.tar.gz')
sha256sums=('0ee39a36b34a195fd5badd7cf37f667e6db13c9a7d5368f9296d7ea26468159d')

package() {
  cp -R usr $pkgdir
}
