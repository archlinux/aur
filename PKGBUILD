#
# SimGrid: Framework for the simulation of distributed applications
#

# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=simgrid
pkgver=3.25
pkgrel=1
pkgdesc='A scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems.'
arch=('i686' 'x86_64')
url='https://simgrid.org/'
license=('LGPL')
source=('https://framagit.org/simgrid/simgrid/-/archive/v3.25/simgrid-v3.25.tar.gz')
depends=('boost')
makedepends=('cmake')
md5sums=('01eda7dda7488e6bf1acb7a335037857')

pkgver() {
  echo 3.25
}

package() {
  mkdir -p $pkgdir/opt/simgrid
  cd $srcdir/simgrid-v3.25/
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/simgrid .
  make
  make install
}
