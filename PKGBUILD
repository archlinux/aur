# Maintainer: Daurnimator <daurnimator@archlinux.org>

pkgname=('lua-binaryheap' 'lua51-binaryheap' 'lua52-binaryheap' 'lua53-binaryheap')
pkgver=0.4
pkgrel=2
arch=('any')
url='https://github.com/Tieske/binaryheap.lua'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Tieske/binaryheap.lua/archive/version_0v4.tar.gz")
sha256sums=('10b1b6c6f2d22560f512f9896a6672ec5ae0eea1390ff8e662be1d5d9625b438')

package_lua-binaryheap() {
	pkgdesc='Binary heap implementation for Lua 5.4'

	cd "binaryheap.lua-version_0v4"
	install -Dm644 src/binaryheap.lua "$pkgdir/usr/share/lua/5.4/binaryheap.lua"
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

package_lua53-binaryheap() {
	pkgdesc='Binary heap implementation for Lua 5.3'

	cd "binaryheap.lua-version_0v4"
	install -Dm644 src/binaryheap.lua "$pkgdir/usr/share/lua/5.3/binaryheap.lua"
}
