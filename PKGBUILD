# Maintainer: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Alfredo Palhares <masterkorp@masterkorp.net>

pkgname=lua-dkjson
pkgver=2.4
pkgrel=2
pkgdesc="Pure Lua JSON module with UTF-8 support and without any dependencies to other external libraries"
arch=(any)
url="http://chiselapp.com/user/dhkolf/repository/dkjson/home"
license=('MIT')
depends=("lua")
source=(dkjson.lua::http://dkolf.de/src/dkjson-lua.fsl/raw/dkjson.lua?name=0b725e9e99117b71a1f62e921c98bf3327ac8809)
md5sums=('51cd3c73f4804b31243886c38d89addd')

package() {
	cd "$srcdir/"
	install -d -m755 "$pkgdir/usr/share/lua/5.3"
	install -D -m644 "dkjson.lua" "$pkgdir/usr/share/lua/5.3/dkjson.lua"
}
