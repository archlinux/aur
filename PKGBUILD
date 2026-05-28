# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luacov-reporter-gcovr' 'lua51-luacov-reporter-gcovr' 'lua52-luacov-reporter-gcovr' 'lua53-luacov-reporter-gcovr')
_pkgbase='luacov-reporter-gcovr'
pkgdesc='A luacov reporter that creates gcovr json files'
pkgver=0.0.5
pkgrel=2
arch=('any')
url='https://buffering.party/software/luacov-reporter-gcovr/'
license=('MIT')
source=("${url}${_pkgbase}-$pkgver.tar.gz")

package_lua-luacov-reporter-gcovr() {
    pkgdesc+=''
    depends=('lua' 'lua-luacov')

    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.4/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.1'
    depends=('lua51' 'lua51-luacov')

    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.1/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.2'
    depends=('lua52' 'lua52-luacov')

    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.2/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.3'
    depends=('lua53' 'lua53-luacov')

    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.3/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=(
'a95b43c37cd118f04a18e0857a95881eb2786ccb56199494c4e2cf0f5b306c7de6d298b4eb3d658b245b1359bfd0749b16ed1615ddb0c809d22a454062a9a590'
)
