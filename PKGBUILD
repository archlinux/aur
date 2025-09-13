
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
sha512sums=("c9805c8c2bb6b92f65f20aa0021600062c7d5131cb88150d6b37606736638b7aca8f9bbea0f9fa67883b62215396ffd02a54d4dff2f6e30c3ca36798271fbfb3")

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname/v"
	cp "$srcdir/$pkgname-$pkgver.tgz" "$pkgdir/usr/share/$pkgname/v/$_pkgsum.tgz"
}


