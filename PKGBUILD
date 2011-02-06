pkgname=plptools
pkgver=1.0.11
pkgrel=1
pkgdesc="plptools is a set of libraries and utilities for enabling Unix systems
to communicate with EPOC PDAs such as the Psion 5mx, Psion Revo and Geofox via
the PDA's serial link."
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://plptools.sourceforge.net/"
source=(http://mesh.dl.sourceforge.net/project/plptools/plptools/1.0.11/plptools-1.0.11.tar.gz)
md5sums=(4779b5dc0a3de3bafbd26350ce0087d4)
depends=(fuse)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=$pkgdir/usr install
}
