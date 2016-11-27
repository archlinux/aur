# Maintainer: holos
# Contributor: tantalum

pkgname=guile-json
pkgrel=1
pkgver=0.5.0
pkgdesc='JSON module for Guile'
url="https://github.com/aconchillo/guile-json"
arch=('any')
license=('LGPL')
source=("http://download.savannah.gnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('0dd9327f4d6edfcd7ca48c8d854bf4c0028ff276cc4f7ffcd72d5b9128190a51')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
