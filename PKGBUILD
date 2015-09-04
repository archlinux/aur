# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=acts
pkgver=1.1
pkgrel=1
pkgdesc="Another Calendar-based Tarsnap Script"
arch=("any")
url="https://github.com/alexjurkiewicz/acts"
license=("Public Domain")
conflicts=("acts-git")
depends=("tarsnap"
	 "coreutils"
	 "util-linux")
backup=("etc/acts.conf")
install=$pkgname.install
source=(https://github.com/alexjurkiewicz/acts/archive/$pkgver.tar.gz)
md5sums=('4d2cb10d2cb2403a13b56a82365f08c8')

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "$pkgdir/usr/bin"
	install -m755 acts "$pkgdir/usr/bin"

	mkdir -p "$pkgdir/etc"
	install -m644 acts.conf "$pkgdir/etc"
}

# vim: set ts=8 sw=8 tw=0 noet :
