# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=aunit
pkgver=2022
pkgrel=1
pkgdesc="Ada Unit Testing Framework"

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('https://github.com/AdaCore/aunit/archive/refs/tags/v22.0.0.tar.gz')
sha1sums=('3d2a87bc0260311aa7a821b4fca597a7c9b09efc')

_pkg_src_dir="aunit-22.0.0"


build()
{
  cd "$srcdir/$_pkg_src_dir"
  make
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  make INSTALL="$pkgdir/usr" install
}
