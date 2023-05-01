# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=ziit
pkgver=1.2.0
pkgrel=1
pkgdesc="A cli to track times in combination with to the ziit-server."
arch=('x86_64')
url="https://dev.acosom.com/acosom/ziit/ziit-cli/"
license=('MIT')
depends=('cargs' 'libsodium' 'protobuf-c' 'chrono-date')
source=("https://dev.acosom.com/~downloads/projects/11/archives?revision=v$pkgver&format=tgz")
md5sums=('5a65be1e9d96ad1d6b6aabe2e9ff8662')

build() {
  make all
}

check() {
	make check
}

package() {
  make prefix=/usr DESTDIR="$pkgdir" install
}
