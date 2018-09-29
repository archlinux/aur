# Maintainer: osch <oliver@luced.de>
pkgname=lake
pkgver=1.4.1
pkgrel=1
pkgdesc="Lua-based Build Tool"
arch=("i686" "x86_64")
url="https://github.com/stevedonovan/Lake"
license=("MIT")
depends=("lua" "lua-filesystem" "lua-posix")
source=("$pkgname-$pkgver.tar.gz::https://github.com/stevedonovan/Lake/archive/$pkgver.tar.gz")


package() {
	cd "$srcdir/Lake-$pkgver"

	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 lake "$pkgdir/usr/bin/lake"
}
md5sums=('692ab4b24d307a81f5860b0f1ab681a3')
