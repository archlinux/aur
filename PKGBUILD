# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-fifo' 'lua51-fifo' 'lua52-fifo')
pkgver=0.2
pkgrel=1
arch=('any')
url='https://github.com/daurnimator/fifo.lua'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daurnimator/fifo.lua/archive/$pkgver.tar.gz")
md5sums=('8f2744f6199eaee9676430d1f0136605')

package_lua-fifo() {
	pkgdesc='Fifo library for Lua 5.3'

	cd "fifo.lua-$pkgver"
	install -Dm644 fifo.lua "$pkgdir/usr/share/lua/5.3/fifo.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-fifo() {
	pkgdesc='Fifo library for Lua 5.1'

	cd "fifo.lua-$pkgver"
	install -Dm644 fifo.lua "$pkgdir/usr/share/lua/5.1/fifo.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-fifo() {
	pkgdesc='Fifo library for Lua 5.2'

	cd "fifo.lua-$pkgver"
	install -Dm644 fifo.lua "$pkgdir/usr/share/lua/5.2/fifo.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
