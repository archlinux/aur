# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.02.25
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="http://kernel.ubuntu.com/~cking/powerstat/"
license=('GPL2')
depends=('glibc')
source=("https://kernel.ubuntu.com/~cking/tarballs/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0ba3023979c494323af5090b29dd97d922ef79df1c44237443a06152fbeab136')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
