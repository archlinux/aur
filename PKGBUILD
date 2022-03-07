# Maintainer: Mai Lawton
# Contributor: Mai Lawton
pkgname=alterfalter
pkgver=1
pkgrel=1
pkgdesc="drachenlord saying alter falter"
arch=('x86_64')
url='https://github.com/maidado/alterfalter'
depends=("alsa-utils")
optdepends=("pulseaudio: ALSA alternative")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('6ef2bbd25ed39055a9f4754c6ffdfbb17c0896b0c1562bb0327365db48eb1f8d')
build() {
   cd "$pkgname-$pkgver"
   
}

package() {
   cd "$pkgname-$pkgver"
   make install DESTDIR="$pkgdir" PREFIX=/usr
}

