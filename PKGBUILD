# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-commons-bin
pkgver=0.99_1484075143
pkgrel=1

pkgdesc="Common files of Hets"

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('java-runtime>=7')
provides=('hets-commons')
conflicts=('hets-commons')
source=('http://hets.eu/downloads/hets/archlinux/x86_64/hets-commons-bin-0.99_1484075143-1.tar.gz')
sha256sums=('e973baa91542cd1f6d1c512bf3f5f7428341b33a87334e6b748288c2dec04ccc')

package() {
  cp -R usr $pkgdir
}
