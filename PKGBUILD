# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-binaryheap' 'lua51-binaryheap' 'lua52-binaryheap')
pkgver=0.4
pkgrel=1
arch=('any')
url='https://github.com/Tieske/binaryheap.lua'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tieske/binaryheap.lua/archive/version_0v4.tar.gz")
md5sums=('8dc4ea3df17fc7c586693d6fb6f0a8a3')

package_lua-binaryheap() {
	pkgdesc='Binary heap implementation for Lua 5.3'

	cd "binaryheap.lua-version_0v4"
	install -Dm644 src/binaryheap.lua "$pkgdir/usr/share/lua/5.3/binaryheap.lua"
}

package_lua51-binaryheap() {
	pkgdesc='Binary heap implementation for Lua 5.1'

	cd "binaryheap.lua-version_0v4"
	install -Dm644 src/binaryheap.lua "$pkgdir/usr/share/lua/5.1/binaryheap.lua"
}

package_lua52-binaryheap() {
	pkgdesc='Binary heap implementation for Lua 5.2'

	cd "binaryheap.lua-version_0v4"
	install -Dm644 src/binaryheap.lua "$pkgdir/usr/share/lua/5.2/binaryheap.lua"
}
