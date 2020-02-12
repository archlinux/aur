# Maintainer: epsilontheta <voidptr at outlook dot de>
pkgname=archupdate-indicator
pkgver=1.0.0
pkgrel=1
pkgdesc="Creates a taskbar icon that indicates if updates are available and provides a context \
menu to inspect and install them."
arch=('any')
url="https://github.com/epsilontheta/archupdate-indicator"
license=('MIT')
depends=('pacman-contrib' 'python-wxpython')
source=("https://github.com/epsilontheta/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ecf6088ca8b7d5084f445732ab7fb411757cac0da4eec2a9bfc448eab70ab5d7')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./archupdate-indicator.py -t "$pkgdir/usr/bin/"
	install -Dm644 ./img/*.png -t "$pkgdir/usr/share/pixmaps/$pkgname/"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
