#
# SimGrid: Grid and Cloud Simulator
#

# Maintainer: Javier J. Salmeron-Garcia <javsalgar@gmail.com>
pkgname=simgrid-stable
pkgver=3.11.1
pkgrel=1
pkgdesc='Grid and Cloud Simulator (Stable Version)'
arch=('i686' 'x86_64')
url='http://simgrid.gforge.inria.fr/index.html'
license=('GPL')
source=('http://gforge.inria.fr/frs/download.php/file/33686/SimGrid-3.11.1.tar.gz')
makedepends=('cmake')
md5sums=('SKIP')

pkgver() {
  echo 3.11.1  
}


package() {
        mkdir -p $pkgdir/opt/simgrid
	cd $srcdir/SimGrid-3.11/
	cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/simgrid .
	make
	make install
}
