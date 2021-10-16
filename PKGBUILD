# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.02.26
pkgrel=2
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://launchpad.net/powerstat"
license=('GPL2')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/${pkgver}-1/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('b3bf4f514c5e3cdcc23bb97878104c4b030883576e981e7701d26738d02ca8a2')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
