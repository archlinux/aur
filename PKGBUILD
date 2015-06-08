# Maintainer: willemw <willemw12@gmail.com>
# Contributor: T - rttommy@gmail.com

pkgname=rubix
pkgver=1.0.6
pkgrel=2
pkgdesc="Rubik's cube program"
url="http://sed.free.fr/rubix/"
license=('unknown')     # Public Domain
arch=('i686' 'x86_64')
depends=(libx11)
source=http://sed.free.fr/rubix/$pkgname-$pkgver.tar.bz2
md5sums=('76346b49b67dd7ade0f69b4ae77e3f3a')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 rubix "$pkgdir/usr/bin/rubix"
}

