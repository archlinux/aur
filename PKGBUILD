# Maintainer: holos
# Contributor: tantalum

pkgname=guile-json
pkgrel=1
pkgver=0.4.0
pkgdesc='JSON module for Guile'
url="https://github.com/aconchillo/guile-json"
arch=('any')
license=('LGPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0696062439ceb00d1026e9c352e8a6fac22de6fd6e38a9f5e7cc139ec511066c')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
