# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-lpeg-patterns' 'lua51-lpeg-patterns' 'lua52-lpeg-patterns')
pkgver=0.5
pkgrel=1
arch=('any')
url='https://github.com/daurnimator/lpeg_patterns'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daurnimator/lpeg_patterns/archive/v$pkgver.tar.gz")
md5sums=('c46992342f42ea5dadf26ad28899dfa3')

package_lua-lpeg-patterns() {
	pkgdesc='A collection of LPEG patterns for Lua 5.3'
	depends=('lua-lpeg')

	cd "lpeg_patterns-$pkgver"
	install -Dm644 lpeg_patterns/* -t "$pkgdir/usr/share/lua/5.3/lpeg_patterns/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-lpeg-patterns() {
	pkgdesc='A collection of LPEG patterns for Lua 5.1'
	depends=('lua51-lpeg')

	cd "lpeg_patterns-$pkgver"
	install -Dm644 lpeg_patterns/* -t "$pkgdir/usr/share/lua/5.1/lpeg_patterns/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-lpeg-patterns() {
	pkgdesc='A collection of LPEG patterns for Lua 5.2'
	depends=('lua52-lpeg')

	cd "lpeg_patterns-$pkgver"
	install -Dm644 lpeg_patterns/* -t "$pkgdir/usr/share/lua/5.2/lpeg_patterns/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
