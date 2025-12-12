
# Contributor: Li Junhao <l@x-cmd.com>
# Maintainer: Li Junhao <l@x-cmd.com>
pkgname=x-cmd
pkgver=v0.7.5
_pkgsum=.bfa8caf9
pkgrel=1
pkgdesc="Bootstrap 1000+ command line tools in seconds"
url="https://www.x-cmd.com"
arch=("any")
license=("AGPL-3.0")
source=("$pkgname-$pkgver.tgz::https://raw.githubusercontent.com/x-cmd/release/main/dist/$pkgver/allinone.tgz")
install="$pkgname.install"
options=(!debug)
sha512sums=("4268421c842a6710f0f899ad021a1072ff5c28cef9ef5b251618a2e2e5f2bba1cd746c73117e22883a2fb23034da042686eb6e3adc693b284a73cb6f13aa396d")

package() {
	mkdir -p "$pkgdir/usr/share/$pkgname/v"
	cp "$srcdir/$pkgname-$pkgver.tgz" "$pkgdir/usr/share/$pkgname/v/$_pkgsum.tgz"
}


