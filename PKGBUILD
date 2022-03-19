# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-inspect' 'lua51-inspect' 'lua52-inspect' 'lua53-inspect')
_pkgbase='inspect.lua'
pkgver=3.1.3
pkgrel=1
arch=('any')
url='https://github.com/kikito/inspect.lua'
license=('MIT')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
md5sums=('1180dda59d097f10607571dc18cb7ba1')

package_lua-inspect() {
    pkgdesc='Human-readable representation of Lua tables'
    depends=('lua')

    cd "$_pkgbase-$pkgver"
    install -Dm644 inspect.lua "$pkgdir/usr/share/lua/5.4/inspect.lua"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.1'
    depends=('lua51')

    cd "$_pkgbase-$pkgver"
    install -Dm644 inspect.lua "$pkgdir/usr/share/lua/5.1/inspect.lua"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.2'
    depends=('lua52')

    cd "$_pkgbase-$pkgver"
    install -Dm644 inspect.lua "$pkgdir/usr/share/lua/5.2/inspect.lua"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-inspect() {
    pkgdesc='Human-readable representation of Lua tables for Lua 5.3'
    depends=('lua53')

    cd "$_pkgbase-$pkgver"
    install -Dm644 inspect.lua "$pkgdir/usr/share/lua/5.3/inspect.lua"
    install -Dm644 MIT-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

