
# Contributor: Li Junhao <l@x-cmd.com>
# Maintainer: Li Junhao <l@x-cmd.com>
pkgname=x-cmd
pkgver=v0.9.9
_pkgsum=.43e6b44a
pkgrel=1
pkgdesc="Bootstrap 1000+ command line tools in seconds"
url="https://www.x-cmd.com"
arch=("any")
license=("Apache-2.0")
source=("$pkgname-$pkgver.tgz::https://raw.githubusercontent.com/x-cmd/release/main/dist/$pkgver/allinone.tgz")
install="$pkgname.install"
options=(!debug)
sha512sums=("7e4863c8c3bd0858ec9fcf05739bd2f54e9bb8831e0a94772d2fd8966c1305d584dcc4cf69d8299e943481db16efe61df6adc37dfea435e18bb3ccc374ed29b7")

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname/v"
	cp "$srcdir/$pkgname-$pkgver.tgz" "$pkgdir/usr/share/$pkgname/v/$_pkgsum.tgz"
}


