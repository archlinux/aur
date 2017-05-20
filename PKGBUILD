# Maintainer: Andrew Lamarra <andrew DOT lamarra AT gmail DOT com>
pkgname=timertab
pkgver=1.3
pkgrel=1
pkgdesc="An easy way to manage your Systemd Timers."
arch=('any')
url="https://github.com/amlamarra/timertab"
license=('GPL3')
depends=('systemd' 'bash')
source=("$pkgname-$pkgver.tar.gz::https://github.com/amlamarra/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('4ce87c8da2d9ee8606b4dd53a48d6bd1b8ba8aca1a59e8cdf45b86657bfab084')

package () {
	install -Dm755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
