# Maintainer : Ellis Clayton <ellis at ellis dot codes>

pkgname=nofi-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="An interruption-free notification system for Linux"
arch=('x86_64')
url="https://github.com/ellsclytn/nofi"
license=('MIT')
provides=('nofi')
depends=('rofi' 'libnotify' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ellsclytn/nofi/releases/download/v0.2.1/nofi-0.2.1-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('b326443eac80180524343a1d753a5736cefff12f82404b8786a4eaae0ea5d19c00392a152feb26e19a4a90276888edb109db8456b9e5a3489f76d02778e82d78')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 nofi "$pkgdir/usr/bin/nofi"
}
