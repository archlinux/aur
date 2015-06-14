# Maintainer: shirokuro <tod dot jackson at gmail dot com>
# Contributor: giovanni   

pkgname=bdf2c
pkgver=20100924
pkgrel=1
pkgdesc="Convert BDF font to C source code"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glibc')
url="http://sourceforge.net/projects/bdf2c/"
source=("http://downloads.sourceforge.net/project/bdf2c/Source/bdf2c-2010-09-24-17.tar.bz2")
md5sums=('554dbc94321ad17ab2d00a80b64f5125')

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/bin
  cp bdf2c $pkgdir/usr/bin
}
