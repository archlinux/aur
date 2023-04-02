# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=ziit
pkgver=1.0.0
pkgrel=1
pkgdesc="A cli to track times in combination with to the ziit-server."
arch=('x86_64')
url="https://dev.acosom.com/acosom/ziit/ziit-cli/"
license=('MIT')
depends=('cargs' 'libsodium' 'protobuf-c')
source=("https://dev.acosom.com/~downloads/projects/11/archives?revision=v$pkgver&format=tgz")
md5sums=('c6cdc3eaafacd60401c9b8e23375bef6')

build() {
  make all
}

check() {
	make check
}

package() {
  make prefix=/ bindir=/usr/bin DESTDIR="$pkgdir" install
}
