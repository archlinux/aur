# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=alarm-clock
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple alarm clock with Outlook reminder integration"
url="https://github.com/chocolateimage/alarm-clock"
license=('GPL-3.0-only')
arch=("x86_64")
depends=(
	'python'
	'python-pyqt6'
	'python-requests'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7c62a21bcf24ffeaa84b59131dcb1dc5fc3a9164854c9199c28d70a3cf91eab3')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/bin/"
	install -dm755 "$pkgdir/usr/share/applications/"

	cp "alarm-clock.py" "$pkgdir/usr/bin/alarm-clock"
	cp "alarm-clock.desktop" "$pkgdir/usr/share/applications/"
}
