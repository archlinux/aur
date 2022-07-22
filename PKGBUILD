# Maintainer: oscareczek <oscareczek at gmail dot com>
# Contributor: David P. <megver83@openmailbox.org>
# Contributor: Amadeusz Żołnowski

pkgname=plymouth-openrc-plugin
pkgver=0.1.3
pkgrel=1
pkgdesc='Plymouth plugin for OpenRC'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://github.com/Kangie/plymouth-openrc-plugin'
license=('GPL2')
depends=('plymouth' 'openrc')
source=('https://github.com/Kangie/plymouth-openrc-plugin/archive/refs/tags/v0.1.3.tar.gz')
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/usr" install
}
