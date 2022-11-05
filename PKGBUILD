# Maintainer: willemw <willemw12@gmail.com>

pkgname=fapg
pkgver=0.43
pkgrel=1
pkgdesc="Fast Audio Playlist Generator"
arch=('x86_64')
url="http://royale.zerezo.com/fapg/"
license=('GPL2')
depends=('uriparser')
source=("$url/$pkgname-$pkgver.tar.gz")
sha256sums=('0b0054a61691c350e151f9391e1898a37facdc8ff7440a1953f83b36b293cbdc')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

