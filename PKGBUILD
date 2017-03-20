# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.0
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL')
depends=('bash' 'systemd')
source=("timertab")
sha256sums=('b3009daa73d1d21fb8a42f2335dcc1f0ec106f86461c6915f8fe4ba563f7f90a')

package () {
	install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
