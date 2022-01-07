# Maintainer: Tomas Krizek <tomas.krizek@mailbox.org>

pkgname=('lua-curl' 'lua51-curl' 'lua52-curl' 'lua53-curl')
_pkgname=Lua-cURL
pkgver=0.3.13
pkgrel=1
arch=('x86_64')
url='https://github.com/Lua-cURL/Lua-cURLv3'
license=('MIT')
depends=('curl')
makedepends=('lua' 'lua51' 'lua52' 'lua53')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgname}/${_pkgname}v3/archive/v${pkgver}.tar.gz")
sha256sums=('aba40511a7cac4422c0238d1db42b2124ea5a727b0745f7f434f3dc119cbb2db')

package_lua-curl() {
    pkgdesc="Lua 5.4 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua install
}

package_lua51-curl() {
    pkgdesc="Lua 5.1 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua51 install
}

package_lua52-curl() {
    pkgdesc="Lua 5.2 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua52 install
}

package_lua53-curl() {
    pkgdesc="Lua 5.3 binding to libcurl"

    cd "${_pkgname}v3-${pkgver}"
    make clean
    make DESTDIR="${pkgdir}/" LUA_IMPL=lua53 install
}
