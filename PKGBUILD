# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=lua-std-normalize
_realname=normalize
pkgver=2.0.2
pkgrel=2
pkgdesc="Normalized Lua functions"
arch=('any')
url="https://github.com/lua-stdlib/normalize#normalized-lua-functions"
license=('MIT')
depends=('lua')
conflicts=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/lua-stdlib/normalize/archive/v$pkgver.tar.gz")
md5sums=('ef79927f6d272182bf5d4fdc5e89dd8f')

package() {
	cd "$srcdir/$_realname-$pkgver"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 lib/std/normalize/*.lua -t "$pkgdir"/usr/lib/lua/5.3/std/normalize/
}

