# Maintainer : Ellis Clayton <ellis at ellis dot codes>

pkgname=nofi-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="An interruption-free notification system for Linux"
arch=('x86_64')
url="https://github.com/ellsclytn/nofi"
license=('MIT')
provides=('nofi')
depends=('rofi' 'libnotify' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ellsclytn/nofi/releases/download/v0.2.3/nofi-0.2.3-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('12c5fa9c1c7e84cf506c64cc12f573b3564c39b0e9be6fccacb3d877fd9381782846b8edec6db270571398f768a171e91b3a73cb929e616520b5715cb8c62790')

package() {
	cd "nofi-$pkgver"
	install -Dm755 nofi "$pkgdir/usr/bin/nofi"
}
