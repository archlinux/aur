# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Adam Lawson <dev@goshawk22.uk>

pkgname=powerstat
pkgver=0.04.02
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://github.com/ColinIanKing/powerstat"
license=('GPL2')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/$pkgname/archive/refs/tags/V$pkgver.tar.gz")
sha256sums=('51b79161fc1dfc8776c025cb726bde331393c177cfe71dbc1fd95b59ef470aaf')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
