# Maintainer: depsterr <depsterr at protonmail dot com>
pkgname=ircc
pkgver=0.1.0
pkgrel=1
pkgdesc='A Minimal Curses IRC Client'
arch=('any')
url='https://c9x.me/irc/'
license=('public domain')
depends=('ncurses' 'openssl')
makedepends=('git')
source=('git://c9x.me/irc.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/irc"
	make
}

package() {
	cd "$srcdir/irc"
	mkdir -p "$pkgdir/usr/bin"
	mv "irc" "$pkgdir/usr/bin/ircc"
}
