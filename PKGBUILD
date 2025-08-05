# Maintainer hyx2014 <hyx20140408@163.com>
pkgname=libtb-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="tbsys and tbnet devel"
arch=('x86_64')
depends=('glibc')
url="https://github.com/hyx-web/libtb"
provides=(
    "libtb=1.0.0"
)
source=(https://github.com/hyx-web/libtb/releases/download/dev/libtb.zip)

build()
{
  cd "$srcdir"
}

package()
{
  cd "$srcdir"
  mkdir -p $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/include
  cp -r include/* $pkgdir/usr/include
  cp -r lib/* $pkgdir/usr/lib
}

sha256sums=("SKIP")
