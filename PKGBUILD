# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
pkgname='google-font-download'
pkgver='1.4.2'
pkgrel='1'
pkgdesc='Google web font downloader'
arch=('any')
url="https://github.com/neverpanic/$pkgname"
license=('BSD')
depends=('curl' 'ncurses')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7779cc4cbad7504c823c7db5a07a48f7e7b553ee82b1f1d8c88237f1b95336dc')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
