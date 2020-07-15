# Maintainer: Rod Kay   <charlie5 on #ada at freenode.net>

pkgname=aunit
pkgver=2020
pkgrel=1
pkgdesc="Ada Unit Testing Framework"

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild')

source=('https://community.download.adacore.com/v1/6c8702d4a3c4a39f5da077716e44bef980377ba8?filename=aunit-2020-20200429-19B6C-src.tar.gz')
sha1sums=('6c8702d4a3c4a39f5da077716e44bef980377ba8')

_pkg_src_dir="aunit-2020-20200429-19B6C-src"


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
