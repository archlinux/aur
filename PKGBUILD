# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-irc-formatter' 'lua51-irc-formatter' 'lua52-irc-formatter' 'lua53-irc-formatter')
pkgdesc='A simple formatter/serializer for IRC messages.'
_pkgname='irc-formatter'
pkgver=1.0.1
pkgrel=1
arch=('any')
url='https://github.com/jprjr/lua-irc-formatter'
license=('MIT')
source=("https://github.com/jprjr/lua-irc-formatter/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")

package_lua-irc-formatter() {
    pkgdesc+=''
    depends=('lua<5.5')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-formatter.lua "$pkgdir/usr/share/lua/5.4/irc-formatter.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-irc-formatter() {
    pkgdesc+=' for Lua 5.1'
    depends=('lua51')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-formatter.lua "$pkgdir/usr/share/lua/5.1/irc-formatter.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-irc-formatter() {
    pkgdesc+=' for Lua 5.2'
    depends=('lua52')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-formatter.lua "$pkgdir/usr/share/lua/5.2/irc-formatter.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-irc-formatter() {
    pkgdesc+=' for Lua 5.3'
    depends=('lua53')

    cd "$_pkgname-$pkgver"
    install -Dm644 src/irc-formatter.lua "$pkgdir/usr/share/lua/5.3/irc-formatter.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('dc251e5d35145985c618a476e25a31b8840db19405d6aa7e6cad0a676e93ff85')
