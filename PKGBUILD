# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-date' 'lua51-date' 'lua52-date' 'lua53-date')
pkgver=2.2
pkgrel=1
pkgdesc="Date & Time module for Lua"
arch=('any')
url='https://github.com/tieske/date'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/version_$pkgver.tar.gz")
sha256sums=('ea8c34cb18245c5219806a00c97ef92f452a33f3528bac2ae72743e4420897db')

package_lua-date(){
	depends=('lua')

	cd "date-version_$pkgver"
	install -Dm 644 src/date.lua -t "$pkgdir/usr/share/lua/5.4/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua51-date(){
	depends=('lua51')

	cd "date-version_$pkgver"
	install -Dm 644 src/date.lua -t "$pkgdir/usr/share/lua/5.1/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua52-date(){
	depends=('lua52')

	cd "date-version_$pkgver"
	install -Dm 644 src/date.lua -t "$pkgdir/usr/share/lua/5.2/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

package_lua53-date(){
	depends=('lua53')

	cd "date-version_$pkgver"
	install -Dm 644 src/date.lua -t "$pkgdir/usr/share/lua/5.3/"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
