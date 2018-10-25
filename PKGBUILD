# Maintainer: Kilian Guillaume "cafehaine" <kilian dot guillaume at gmail dot com>
pkgname=lua-std-_debug
_realname=_debug
pkgver=1.0.1
pkgrel=1
pkgdesc="Lua Debug Hints Library"
arch=('any')
url="https://github.com/lua-stdlib/_debug#debug-hints-library"
license=('MIT')
depends=('lua')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lua-stdlib/_debug/archive/v$pkgver.tar.gz")
md5sums=('ccb440f3d84e2d56aab8c3dd6bcd0b18')

package() {
	cd "$srcdir/$_realname-$pkgver"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 lib/std/$_realname/*.lua -t "$pkgdir"/usr/lib/lua/5.3/std/$_realname/
}

