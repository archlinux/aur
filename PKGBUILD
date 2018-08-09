# Maintainer: Asher Lieber <lieber dot asher at gmail dot com>
pkgname='libmemcarve'
pkgver=1.3.1
pkgrel=1
pkgdesc="A simple to use library that makes it easy to access the virtual memory of any process"
arch=('any')
url="https://github.com/asherlie/memcarve"
license=('GPL')
provides=('libmemcarve')
source=("$pkgname-$pkgver::git+https://github.com/asherlie/memcarve")
noextract=()
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make install
}
