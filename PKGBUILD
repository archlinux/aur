# Maintainer: anekos <anekos@snca.net>
pkgname=ngt-git
pkgver=20200508
pkgrel=3
pkgdesc="Nearest Neighbor Search with Neighborhood Graph and Tree for High-dimensional Data"
url="https://github.com/yahoojapan/NGT"
arch=('i686' 'x86_64')
license=('Apache_v2')
source=("$pkgname::git+https://github.com/yahoojapan/NGT/")
md5sums=('SKIP')
makedepends=('cmake' 'git')


build () {
  cd $srcdir/$pkgname

  # git checkout v1.7.8

  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" .
  make
}

package () {
  cd $srcdir/$pkgname

  make install
}

# vim:set ts=2 sw=2 et:


