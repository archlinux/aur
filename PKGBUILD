# Maintainer: Jack Roehr <jack@seatgull.com>

pkgname=bombardier
pkgver=1.2.6
pkgrel=1
pkgdesc="Crossplatform HTTP benchmarking tool written in Go"
arch=('x86_64' 'aarch64')
url="https://github.com/codesenberg/bombardier"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("bombardier::git+https://github.com/codesenberg/bombardier")
b2sums=('SKIP')

build() {
	cd "$pkgname"
	go build
}

package() {
	install -Dm755 "$pkgname"/"$pkgname" "$pkgdir/usr/bin/$pkgname"
}
