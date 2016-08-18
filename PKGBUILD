# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=hets-commons-bin
pkgver=0.99_1471209385
pkgrel=1

pkgdesc="Common files of Hets"

url="http://hets.eu"
arch=('i686' 'x86_64')
license=('custom:hets-license')
depends=('java-runtime>=7')
provides=('hets-commons')
conflicts=('hets-commons')
source=('http://www.informatik.uni-bremen.de/~eugenk/aur-hets/hets-commons-bin-0.99_1471209385-1.tar.gz')
sha256sums=('c46579e2883b0b983bbdad0b9adac6f207714701d2ca94e0ec94e9b23162854f')

package() {
  cp -R usr $pkgdir
}
