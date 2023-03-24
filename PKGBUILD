# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.03.02
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/powerstat"
license=('GPL2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/$pkgname/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('f1f3ffb437845613b9b60c015019dd3e587604ea00b3aa2412fc5edeb9a9709b')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
