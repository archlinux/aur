# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.4
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL3')
depends=('systemd' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amlamarra/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5d50019d439dd63188286aba920aa39e1b2e4e7b6a5c1a257b1e0b97881c59c0')

package () {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
