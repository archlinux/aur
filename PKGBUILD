#
# SimGrid: Framework for the simulation of distributed applications
#

# Maintainer: Millian Poquet <millian.poquet@gmail.com>
pkgname=simgrid
pkgver=3.22.2
pkgrel=1
pkgdesc='A scientific instrument to study the behavior of large-scale distributed systems such as Grids, Clouds, HPC or P2P systems.'
arch=('i686' 'x86_64')
url='https://simgrid.org/'
license=('LGPL')
source=('https://framagit.org/simgrid/simgrid/uploads/b086147968e111e7b7d7e27e8c4b11c5/SimGrid-3.22.tar.gz')
depends=('boost')
makedepends=('cmake')
md5sums=('d5c229b2b53b9bb9a1136d5720db7e47')

pkgver() {
  echo 3.22.2
}

package() {
  mkdir -p $pkgdir/opt/simgrid
  cd $srcdir/SimGrid-3.22/
  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/simgrid .
  make
  make install
}
