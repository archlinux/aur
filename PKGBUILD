
# Contributor: Li Junhao <l@x-cmd.com>
# Maintainer: Li Junhao <l@x-cmd.com>
pkgname=x-cmd
pkgver=v0.5.5
_pkgsum=.369a6a4b
pkgrel=1
pkgdesc="Bootstrap 1000+ command line tools in seconds"
url="https://www.x-cmd.com"
arch=("any")
license=("AGPL-3.0")
source=("$pkgname-$pkgver.tgz::https://raw.githubusercontent.com/x-cmd/release/main/dist/$pkgver/allinone.tgz")
install="$pkgname.install"
options=(!debug)
sha512sums=("97186f820be557ed7b7e21b19a5aee183c21f5122739971137703c8c9cd266c296cc0143eb0db434e5fe1069bdc5481bc441b0ef1ed489c7bd9172f60d94f5b9")

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname/v"
	cp "$srcdir/$pkgname-$pkgver.tgz" "$pkgdir/usr/share/$pkgname/v/$_pkgsum.tgz"
}


