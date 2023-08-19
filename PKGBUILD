# Maintainer : Ellis Clayton <ellis at ellis dot codes>

pkgname=nofi-bin
pkgver=0.2.4
pkgrel=1
pkgdesc="An interruption-free notification system for Linux"
arch=('x86_64')
url="https://github.com/ellsclytn/nofi"
license=('MIT')
provides=('nofi')
depends=('rofi' 'libnotify' 'dbus')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ellsclytn/nofi/releases/download/v0.2.4/nofi-0.2.4-x86_64-unknown-linux-gnu.tar.gz")
sha512sums=('b8a030cf4fa136a4e01c664526034a99e83bdf86a20858d9caf9783ec87218c4d4626b2165cabf7bd3bd5d89a12ce8617c40729b043cb367c7a09bb79f112167')

package() {
	cd "nofi-$pkgver"
	install -Dm755 nofi "$pkgdir/usr/bin/nofi"
}
