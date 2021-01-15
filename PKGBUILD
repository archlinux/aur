# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-pgmoon' 'lua51-pgmoon' 'lua52-pgmoon' 'lua53-pgmoon')
_pkgbase='pgmoon'
pkgver=1.12.0
pkgrel=1
arch=('any')
url='https://github.com/leafo/pgmoon'
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leafo/pgmoon/archive/v$pkgver.tar.gz")
md5sums=('324b85cea48fd7650cd67ec354b8a783')

package_lua-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.4'
    depends=('lua' 'lua-lpeg')
    optdepends=('lua-cqueues: asynchronous connectivity'
                'lua-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.4/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.4/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.1'
    depends=('lua51' 'lua51-lpeg' 'lua51-bitop')
    optdepends=('lua51-cqueues: asynchronous connectivity'
                'lua51-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.1/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.1/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.2'
    depends=('lua52' 'lua52-lpeg' 'lua52-bitop')
    optdepends=('lua52-cqueues: asynchronous connectivity'
                'lua52-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.2/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.2/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-pgmoon() {
    pkgdesc='PostgreSQL driver written in pure Lua for Lua 5.3'
    depends=('lua53' 'lua53-lpeg')
    optdepends=('lua53-cqueues: asynchronous connectivity'
                'lua53-socket: synchronous connectivity')

    cd "pgmoon-$pkgver"
    install -Dm644 pgmoon.lua "$pkgdir/usr/share/lua/5.3/pgmoon.lua"
    install -Dm644 pgmoon/*.lua -t "$pkgdir/usr/share/lua/5.3/pgmoon"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
