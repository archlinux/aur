# Maintainer: epsilontheta <voidptr at outlook dot de>
pkgname=archupdate-indicator
pkgver=0.0.2
pkgrel=1
pkgdesc="Creates a taskbar icon that indicates if updates are available and provides a context \
menu to inspect and install them."
arch=('any')
url="https://github.com/epsilontheta/archupdate-indicator"
license=('MIT')
depends=('pacman-contrib' 'python-wxpython')
source=("https://github.com/epsilontheta/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('379d385a3a42bd433f3344c19f744de038ed05972004c994bac36e9671d92325')

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./archupdate-indicator.py -t "$pkgdir/usr/bin/"
	install -Dm644 ./img/*.png -t "$pkgdir/usr/share/pixmaps/$pkgname/"
	install -Dm644 ./LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
