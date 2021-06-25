# Maintainer: willemw <willemw12@gmail.com>
# Contributor: T - rttommy@gmail.com

pkgname=rubix
pkgver=1.0.6
pkgrel=3
pkgdesc="Rubik's cube program"
arch=('x86_64')
url="http://sed.free.fr/rubix"
license=('custom:Public Domain')
depends=('libx11')
source=($url/$pkgname-$pkgver.tar.bz2)
sha256sums=('ccff4c98373f76c6bab751f5f5a60df7ad8691c79b56157e4aba2dd76f501a87')

build() {
  make -C $pkgname-$pkgver
}

package() {
  install -Dm755 $pkgname-$pkgver/rubix "$pkgdir/usr/bin/rubix"
}

