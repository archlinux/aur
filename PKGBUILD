# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.03.03
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/powerstat"
license=('GPL2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/$pkgname/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('4d57b119896b777adccaacdf53db32b5b45426a3182adac84f96a64b671a79ee')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
