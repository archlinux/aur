# Maintainer: Asher Lieber <lieber dot asher at gmail dot com>
pkgname='varedit'
pkgver=1.1.11
pkgrel=1
pkgdesc="A fast virtual memory scanner and editor"
arch=('any')
url="https://github.com/asherlie/varedit"
license=('GPL')
provides=('varedit')
source=("$pkgname-$pkgver::git+https://github.com/asherlie/varedit")
noextract=()
md5sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "v" "$pkgdir/usr/bin/ve"
}
