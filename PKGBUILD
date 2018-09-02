# Maintainer: holos
# Contributor: tantalum

pkgname=guile-json
pkgrel=1
pkgver=1.2.0
pkgdesc='JSON module for Guile'
url="https://github.com/aconchillo/guile-json"
arch=('any')
license=('LGPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('89817369f8534d7044818c48c749e1769a4c7e7ac3cda921feeac2d3085af695')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
