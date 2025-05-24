# Maintainer: chocolateimage <chocolateimage@protonmail.com>
pkgname=alarm-clock
pkgver=1.3.1
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
optdepends=(
	'python-selenium: Outlook integration support'
	'selenium-manager: Outlook integration support - Auto installation of ChromeDriver'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/chocolateimage/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b8c3450330366a67ab1af4c09f4a3ea4467f87805fd49304d3710eeeab5bdbc6')

package() {
	cd "$pkgname-$pkgver"

	install -dm755 "$pkgdir/usr/bin/"
	cp "alarm-clock.py" "$pkgdir/usr/bin/alarm-clock"
}
