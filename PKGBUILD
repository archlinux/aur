# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=liquidprompt
pkgver=1.11
pkgrel=1
pkgdesc="A useful adaptive prompt for Bash & Zsh"
arch=("any")
url="https://github.com/nojhan/liquidprompt"
license=("AGPLv3")
conflicts=("liquidprompt-git"
	   "liquidprompt-devel-git")
depends=("ncurses"
	 "grep"
	 "gawk"
	 "sed"
	 "procps-ng"
	 "coreutils")
optdepends=("acpi: Battery and temperature status"
	    "lm_sensors: Temperature status")
source=(https://github.com/nojhan/liquidprompt/archive/v_$pkgver.tar.gz)
md5sums=('4b2562a5cc66829d18c0bffe368af8f0')

package() {
	cd "$pkgname-v_$pkgver"
	install -Dm755 liquidprompt "$pkgdir/usr/bin/liquidprompt"
	install -Dm644 liquidpromptrc-dist "$pkgdir/etc/liquidpromptrc"
}

# vim: set ts=8 sw=8 tw=0 noet :
