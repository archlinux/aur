# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt
pkgver=1.12.1
pkgrel=1
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPLv3")
conflicts=("liquidprompt-git")
depends=("ncurses"
	 "grep"
	 "gawk"
	 "sed"
	 "procps-ng"
	 "coreutils")
optdepends=("acpi: Battery and temperature status"
	    "lm_sensors: Temperature status")
source=(https://github.com/nojhan/liquidprompt/archive/v$pkgver.tar.gz)
md5sums=('c9c5672096791eecd4c2cc904d00bc23')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 liquidprompt "$pkgdir/usr/bin/liquidprompt"
	install -Dm644 liquidpromptrc-dist "$pkgdir/etc/liquidpromptrc"
}

# vim: set ts=8 sw=8 tw=0 noet :
