# Maintainer: jprjr <john@jrjrtech.com>

pkgname=('lua-luacov-reporter-gcovr' 'lua51-luacov-reporter-gcovr' 'lua52-luacov-reporter-gcovr' 'lua53-luacov-reporter-gcovr')
_pkgbase='luacov-reporter-gcovr'
pkgdesc='A luacov reporter that creates gcovr json files'
pkgver=0.0.2
pkgrel=1
arch=('any')
url='https://github.com/jprjr/luacov-reporter-gcovr'
license=('MIT')
source=("$_pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('8d98347292579426b367a655444ba370')

package_lua-luacov-reporter-gcovr() {
    pkgdesc+=''
    depends=('lua' 'lua-luacov')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.4/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua51-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.1'
    depends=('lua51' 'lua51-luacov')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.1/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua52-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.2'
    depends=('lua52' 'lua52-luacov')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.2/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_lua53-luacov-reporter-gcovr() {
    pkgdesc+=' for Lua 5.3'
    depends=('lua53' 'lua53-luacov')

    cd "$_pkgbase-$pkgver"
    install -Dm644 src/gcovr.lua "$pkgdir/usr/share/lua/5.3/luacov/reporter/gcovr.lua"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

