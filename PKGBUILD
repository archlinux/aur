pkgname=libestr
pkgver=0.1.11
pkgrel=1
pkgdesc="essentials for string handling (and a bit more)"
url="http://libestr.adiscon.com/"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
license=('LGPL2.1')
source=("http://libestr.adiscon.com/files/download/libestr-$pkgver.tar.gz")
md5sums=('1f25a2332750d4bfacfb314235fedff0')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}
package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
}
