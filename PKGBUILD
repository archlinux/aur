# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=ziit
pkgver=1.3.1
pkgrel=2
pkgdesc="A cli to track times in combination with to the ziit-server."
arch=('x86_64')
url="https://dev.acosom.com/acosom/ziit/ziit-cli/"
license=('MIT')
depends=('cargs' 'libsodium' 'protobuf-c' 'chrono-date' 'confuse')
source=("https://dev.acosom.com/~downloads/projects/11/archives?revision=v$pkgver&format=tgz")
md5sums=('74892e1cf61f647e98a5acb5f176acd6')

build() {
  make all
}

check() {
  make check
}

package() {
  make prefix=/usr DESTDIR="$pkgdir" install
}
