# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.02.24
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="http://kernel.ubuntu.com/~cking/powerstat/"
license=('GPL2')
depends=('glibc')
source=("https://kernel.ubuntu.com/~cking/tarballs/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('12781cb108be1fc3be5ec893e6d025bfb40ada060bdc5f7715b65397620f2c7b')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
