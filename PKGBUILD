
# Contributor: Li Junhao <l@x-cmd.com>
# Maintainer: Li Junhao <l@x-cmd.com>
pkgname=x-cmd
pkgver=v0.6.13
_pkgsum=.c9805c8c
pkgrel=1
pkgdesc="Bootstrap 1000+ command line tools in seconds"
url="https://www.x-cmd.com"
arch=("any")
license=("AGPL-3.0")
source=("$pkgname-$pkgver.tgz::https://raw.githubusercontent.com/x-cmd/release/main/dist/$pkgver/allinone.tgz")
install="$pkgname.install"
options=(!debug)
sha512sums=("588b5d71d7516995673ef370895dd46666bbdd9eecc927fc371f017bab712ba4a37501343e8fc360ee4eff59a17a2d05255da23f3d0d7d832c1a24490f49ac28")

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname/v"
	cp "$srcdir/$pkgname-$pkgver.tgz" "$pkgdir/usr/share/$pkgname/v/$_pkgsum.tgz"
}


