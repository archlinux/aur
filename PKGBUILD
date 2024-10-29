# Maintainer: Leonard Iklé <leonard.ikle@gmail.com>

pkgname=ziit
pkgver=1.3.6
pkgrel=1
pkgdesc="A cli to track times in combination with to the ziit-server."
arch=('x86_64')
url="https://dev.acosom.com/acosom/ziit/ziit-cli/"
license=('MIT')
depends=('cargs' 'libsodium' 'protobuf-c' 'chrono-date' 'confuse')
source=("https://dev.acosom.com/~downloads/projects/11/archives?revision=v$pkgver&format=tgz")
md5sums=('30e0eb071815587e0f0fca1a63d895e6')

build() {
  make all
}

check() {
  make check
}

package() {
  make prefix=/usr DESTDIR="$pkgdir" install
}
