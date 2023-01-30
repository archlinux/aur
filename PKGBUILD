# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.03.00
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://launchpad.net/powerstat"
license=('GPL2')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/${pkgver}-1/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('cb35735c7a632409491181a68d893fd5bb274be6cc62c5181517c17995d6c1ed')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
