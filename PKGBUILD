# Maintainer: willemw <willemw12@gmail.com>
# Contributor: farid (farid@archlinux-br.org)

pkgname=pixelize	
pkgver=1.0.0
pkgrel=2
pkgdesc="Build a large picture from hundreds of smaller ones"
arch=('i686' 'x86_64')
url="http://lashwhip.com/pixelize.html"
depends=('gtk2')
#optdepends=('imlib')
license=('GPL2')
install=$pkgname.install
source=(http://lashwhip.com/pixelize/pixelize-1.0.0.tar.gz)
md5sums=(b3832915803da637bd619b66974b0031)

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -D -m755 pixelize "$pkgdir/usr/bin/pixelize"
  install -D -m755 make_db "$pkgdir/usr/bin/make_db"
}

