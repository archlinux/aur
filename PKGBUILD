# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='google-font-download'
pkgver='1.4.2'
pkgrel='2'
pkgdesc='Google Fonts web font downloader'
arch=('any')
url="https://github.com/neverpanic/$pkgname"
license=('BSD')
depends=('curl' 'ncurses')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('89e470bfae9c84624903756d397700f0')

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
