# Maintainer: Alex O'Neill <me@aoneill.me>
pkgname=crikey
pkgver=0.8.3
pkgrel=1
epoch=
pkgdesc="A little program that simulates key events."
arch=('i686' 'x86_64')
url="http://www.shallowsky.com/software/crikey/"
license=('unknown')
depends=("libx11" "libxt" "libxtst")
makedepends=("gcc" "make")
source=("http://www.shallowsky.com/software/crikey/$pkgname-$pkgver.tar.gz")
sha256sums=('1be847543ff246b7634a4a0100075a94ffa2a11ce095efa2cb976ac7d9ef78f8')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"

  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgname" "$pkgdir/usr/bin"
}
