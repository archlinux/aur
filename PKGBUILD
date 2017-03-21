# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.0
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL')
depends=('systemd')
source=("https://github.com/amlamarra/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6c62723abeda776624c02ee22c1d986be51ac27642ca34831729eb58955fe407')

package () {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
