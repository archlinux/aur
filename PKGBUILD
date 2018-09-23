# Maintainer: Daurnimator <quae@daurnimator.com>

pkgname=('lua-basexx' 'lua51-basexx' 'lua52-basexx')
pkgver=0.4.0
pkgrel=1
arch=('any')
url='https://github.com/aiq/basexx'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/aiq/basexx/archive/v$pkgver.tar.gz")
md5sums=('c931e3abdb788be95c319be4fa0ac79f')

package_lua-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.3'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.3/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.1'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.1/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-basexx() {
	pkgdesc='A Lua library which provides base2(bitfield), base16(hex), base32(crockford/rfc), base64(rfc/url), base85(z85) decoding and encoding for Lua 5.2'

	cd "basexx-$pkgver"
	install -Dm644 lib/basexx.lua "$pkgdir/usr/share/lua/5.2/basexx.lua"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
