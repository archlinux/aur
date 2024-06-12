# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=opendkim-runit
pkgver=20240612
pkgrel=1
pkgdesc="Runit service script for opendkim."
arch=("any")
url="https://www.opendkim.org"
license=("BSD")
depends=("opendkim" "runit")
source=("opendkim.run")
sha256sums=('d37523497982044784f7ff2cb0623fe4a7c7499d887eada9a2fb816d6951bf24')

package() {
	cd "$srcdir"
	install -Dm755 opendkim.run "$pkgdir/etc/runit/sv/opendkim/run"
}
