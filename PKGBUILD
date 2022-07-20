# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-resty-mpd' 'lua51-resty-mpd' 'lua52-resty-mpd' 'lua53-resty-mpd')
_pkgbase='lua-resty-mpd'
pkgver=5.2.3
pkgrel=1
arch=('any')
url='https://github.com/jprjr/lua-resty-mpd/'
license=('MIT')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('92dbd956d5001008c1df2dbba75e3cf6')

package_lua-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.4'
    depends=('lua')
	optdepends=('lua-cqueues'
                'lua-socket')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/resty/mpd.lua "$pkgdir/usr/share/lua/5.4/resty/mpd.lua"
    install -Dm644 src/resty/mpd/backend.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/backend.lua"
    install -Dm644 src/resty/mpd/commands.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/commands.lua"
    install -Dm644 src/resty/mpd/stack.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/stack.lua"
    install -Dm644 src/resty/mpd/backend/cqueues.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/backend/cqueues.lua"
    install -Dm644 src/resty/mpd/backend/luasocket.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/backend/luasocket.lua"
    install -Dm644 src/resty/mpd/backend/nginx.lua "$pkgdir/usr/share/lua/5.4/resty/mpd/backend/nginx.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.1'
    depends=('lua51')
	optdepends=('lua51-cqueues'
                'lua51-socket')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/resty/mpd.lua "$pkgdir/usr/share/lua/5.1/resty/mpd.lua"
    install -Dm644 src/resty/mpd/backend.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/backend.lua"
    install -Dm644 src/resty/mpd/commands.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/commands.lua"
    install -Dm644 src/resty/mpd/stack.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/stack.lua"
    install -Dm644 src/resty/mpd/backend/cqueues.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/backend/cqueues.lua"
    install -Dm644 src/resty/mpd/backend/luasocket.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/backend/luasocket.lua"
    install -Dm644 src/resty/mpd/backend/nginx.lua "$pkgdir/usr/share/lua/5.1/resty/mpd/backend/nginx.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.2'
    depends=('lua52')
	optdepends=('lua52-cqueues'
                'lua52-socket')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/resty/mpd.lua "$pkgdir/usr/share/lua/5.2/resty/mpd.lua"
    install -Dm644 src/resty/mpd/backend.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/backend.lua"
    install -Dm644 src/resty/mpd/commands.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/commands.lua"
    install -Dm644 src/resty/mpd/stack.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/stack.lua"
    install -Dm644 src/resty/mpd/backend/cqueues.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/backend/cqueues.lua"
    install -Dm644 src/resty/mpd/backend/luasocket.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/backend/luasocket.lua"
    install -Dm644 src/resty/mpd/backend/nginx.lua "$pkgdir/usr/share/lua/5.2/resty/mpd/backend/nginx.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-resty-mpd() {
    pkgdesc='A client library for the Music Player Daemon, compatible with OpenResty, cqueues, and Luasocket for Lua 5.3'
    depends=('lua53')
	optdepends=('lua53-cqueues'
                'lua53-socket')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/resty/mpd.lua "$pkgdir/usr/share/lua/5.3/resty/mpd.lua"
    install -Dm644 src/resty/mpd/backend.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/backend.lua"
    install -Dm644 src/resty/mpd/commands.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/commands.lua"
    install -Dm644 src/resty/mpd/stack.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/stack.lua"
    install -Dm644 src/resty/mpd/backend/cqueues.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/backend/cqueues.lua"
    install -Dm644 src/resty/mpd/backend/luasocket.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/backend/luasocket.lua"
    install -Dm644 src/resty/mpd/backend/nginx.lua "$pkgdir/usr/share/lua/5.3/resty/mpd/backend/nginx.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

