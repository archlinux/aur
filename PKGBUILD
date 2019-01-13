# Maintainer: holos
# Contributor: tantalum

pkgname=guile-json
pkgrel=1
pkgver=3.1.0
pkgdesc='JSON module for Guile'
url="https://github.com/aconchillo/guile-json"
arch=('any')
license=('LGPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('e303d0db3f34ac515b8f61db8ed35be8b6c5014d7ab4a5a8ef9b44723ed3d8f9')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
