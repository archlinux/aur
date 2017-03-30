# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.2
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL3')
depends=('systemd' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amlamarra/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('62b00321fc6060342c1164063706817ff4c2b9be6735b61c81dca4aa603c7587')

package () {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
