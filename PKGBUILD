# Contributor: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Earnest <zibeon@gmail.com>
# Contributor: Eugeni Dodonov <eugeni@dodonov.net>
# Contributor: Tom Vincent <aur@tlvince.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=powerstat
pkgver=0.02.28
pkgrel=1
pkgdesc='A tool for measuring a laptops power usage via the battery.'
arch=('i686' 'x86_64')
url="https://launchpad.net/powerstat"
license=('GPL2')
depends=('glibc')
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/$pkgname/${pkgver}-1/${pkgname}_${pkgver}.orig.tar.gz")
sha256sums=('6adc78ad334e414476eda34c725d2ae4e5d28c9c720354b671ee37dacd05484c')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
