# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.02.22
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="http://kernel.ubuntu.com/~cking/powerstat/"
license=('GPL2')
depends=('glibc')
source=("https://kernel.ubuntu.com/~cking/tarballs/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('ef74e023353a24a0a52068a0e474041b9556bcef5b4fe41db44261afd32a6564')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
