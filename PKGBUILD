# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.03.01
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/powerstat"
license=('GPL2')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/${pkgver}-1/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('fc4366de93b68c030cf6c88ae3bdd3ac49560f64f3c8b3545dba40fa3293b327')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
