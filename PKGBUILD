# Maintainer: Alad Wenter <alad@mailbox.org>
pkgname=cottage
pkgver=0.3
pkgrel=1
pkgdesc="Use howm commands, operators and set configuration values through a UNIX socket."
arch=('i686' 'x86_64')
url="https://github.com/HarveyHunt/cottage"
license=('GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/HarveyHunt/cottage/archive/v$pkgver.tar.gz")
sha256sums=('edf196357f7ff86ff615407926e3aa96007f65c5128990b3fa51bd08677a946b')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 cottage "$pkgdir"/usr/bin/cottage
}

# vim:set ts=2 sw=2 et:
