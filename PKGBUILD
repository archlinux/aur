# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-irc-parser' 'lua51-irc-parser' 'lua52-irc-parser' 'lua53-irc-parser')
pkgdesc='An IRC parser for Lua in LPEG, with a Pure-Lua fallback'
_pkgname='irc-parser'
pkgver=1.2.0
pkgrel=3
arch=('any')
url='https://github.com/jprjr/lua-irc-parser'
license=('MIT')
source=("https://github.com/jprjr/lua-irc-parser/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")

package_lua-irc-parser() {
    pkgdesc+=''
    depends=('lua<5.5')
    optdepends=('lua-lpeg: faster parsing')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-parser.lua "$pkgdir/usr/share/lua/5.4/irc-parser.lua"
    install -Dm644 src/irc-parser/fallback.lua "$pkgdir/usr/share/lua/5.4/irc-parser/fallback.lua"
    install -Dm644 src/irc-parser/lpeg.lua "$pkgdir/usr/share/lua/5.4/irc-parser/lpeg.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-irc-parser() {
    pkgdesc+=' for Lua 5.1'
    depends=('lua51')
    optdepends=('lua51-lpeg: faster parsing')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-parser.lua "$pkgdir/usr/share/lua/5.1/irc-parser.lua"
    install -Dm644 src/irc-parser/fallback.lua "$pkgdir/usr/share/lua/5.1/irc-parser/fallback.lua"
    install -Dm644 src/irc-parser/lpeg.lua "$pkgdir/usr/share/lua/5.1/irc-parser/lpeg.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-irc-parser() {
    pkgdesc+=' for Lua 5.2'
    depends=('lua52')
    optdepends=('lua52-lpeg: faster parsing')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-parser.lua "$pkgdir/usr/share/lua/5.2/irc-parser.lua"
    install -Dm644 src/irc-parser/fallback.lua "$pkgdir/usr/share/lua/5.2/irc-parser/fallback.lua"
    install -Dm644 src/irc-parser/lpeg.lua "$pkgdir/usr/share/lua/5.2/irc-parser/lpeg.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-irc-parser() {
    pkgdesc+=' for Lua 5.3'
    depends=('lua53')
    optdepends=('lua53-lpeg: faster parsing')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-parser.lua "$pkgdir/usr/share/lua/5.3/irc-parser.lua"
    install -Dm644 src/irc-parser/fallback.lua "$pkgdir/usr/share/lua/5.3/irc-parser/fallback.lua"
    install -Dm644 src/irc-parser/lpeg.lua "$pkgdir/usr/share/lua/5.3/irc-parser/lpeg.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('ea3ad5ac63a76031327497aaae30c966883f1df7b9170d9333a46b783492162d')
