# Maintainer: willemw <willemw12@gmail.com>
# Contributor: farid (farid@archlinux-br.org)

pkgname=pixelize
pkgver=1.0.0
pkgrel=3
pkgdesc="Build a large picture from hundreds of smaller ones"
arch=('x86_64')
url="http://lashwhip.com/pixelize.html"
depends=('gtk2')
#optdepends=('imlib')
license=('GPL2')
install=$pkgname.install
source=(http://lashwhip.com/pixelize/pixelize-$pkgver.tar.gz)
sha256sums=('580b3577c6bc1353ebabcd32c9700cf2e1afe777077b37f6a99b9d2d5e25a7f8')

build() {
  make -C $pkgname-$pkgver
}

package() {
  install -Dm755 $pkgname-$pkgver/{pixelize,make_db} -t "$pkgdir/usr/bin"
}

