# Maintainer : Ellis Clayton <ellis at ellis dot codes>

pkgname=nofi-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="An interruption-free notification system for Linux"
arch=('x86_64')
url="https://github.com/ellsclytn/nofi"
license=('MIT')
provides=('nofi')
depends=('rofi' 'libnotify' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ellsclytn/nofi/releases/download/v0.2.2/nofi-0.2.2-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('a48f0a66fc3273f40b6709cec23a5c104c05b62372cfe8bca558b03db5662725ef261506e569f571f7ff92e92ba635e78c9a47e827a93295840dfbdc04adb8b5')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 nofi "$pkgdir/usr/bin/nofi"
}
