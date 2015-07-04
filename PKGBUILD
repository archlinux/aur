# Maintainer: Scott Lawrence <bytbox@gmail.com>
# Contributor: Daniel Fiser <danfis (at) danfis (dot) cz>
pkgname=ohcount
pkgver=3.0.0
pkgrel=3
pkgdesc="A source-lines of code counter."
arch=(i686 x86_64)
url="http://labs.ohloh.net/ohcount"
license=('GPL')
depends=(pcre)
makedepends=('ragel>=6.3' bash 'gcc>=4.1.2' swig ruby rake gperf)
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/blackducksw/ohcount/tarball/$pkgver")
md5sums=('85e46186adfbd0c9db1d9a9c9a7efd39')
dfname='blackducksw-ohcount-d7d6124'

build() {
  cd $srcdir/$dfname

  ./build ohcount

  mkdir -p $startdir/pkg/usr/bin

  cp bin/ohcount $startdir/pkg/usr/bin/
}
