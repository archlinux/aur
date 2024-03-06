# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Adam Lawson <dev@goshawk22.uk>

pkgname=powerstat
pkgver=0.04.03
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/powerstat"
license=('GPL2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/$pkgname/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('f7612bb5af9c1355bda30b0441aaab34e0b125bd867e7feac98671fd39de9b17')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
