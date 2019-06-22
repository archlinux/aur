# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=aunit
pkgver=2019
pkgrel=1
pkgdesc="Ada Unit Testing Framework"

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('http://mirrors.cdn.adacore.com/art/5cdf859431e87aa2cdf16b18')
sha1sums=('e5396c2f5cf32db24965a31fd5ef231c1f659964')

_pkg_src_dir="aunit-2019-20190429-18B77-src"


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
