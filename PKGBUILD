# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=watsup
pkgver=4.4
pkgrel=3
arch=('i686' 'x86_64')
makedepends=('xdg-utils')
depends=('libappindicator-gtk3')
license=('GPL3')
pkgdesc="Showing some system status informations"
url="http://www.kornelix.com/watsup"
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
sha256sums=('77de19a76573ad94a3f32171a92299f241c4b03ec98887f0a56fb547747bf1ed')
options=('!emptydirs')

build() {
  cd $pkgname
  make PREFIX=/usr 
}

package() { 
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
