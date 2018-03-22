# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: Brian Knox <taotetek@gmail.com>

pkgname=libestr
pkgver=0.1.10
pkgrel=2
pkgdesc="essentials for string handling (and a bit more)"
url="http://libestr.adiscon.com/"
arch=('x86_64' 'i686')
license=('LGPL2.1')
depends=()
source=("http://libestr.adiscon.com/files/download/libestr-$pkgver.tar.gz")
md5sums=('f4c9165a23587e77f7efe65d676d5e8e')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
}
