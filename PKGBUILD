# Maintainer: Philipp Joram <mail at phijor dot me>

_lua_version=5.3
_lua_name=argparse

pkgname=lua-${_lua_name}
pkgver=0.5.0
pkgrel=1
pkgdesc="Feature-rich command line parser for Lua"
arch=('i686' 'x86_64')
url="https://github.com/mpeterv/argparse"
license=('custom:MIT')
depends=("lua")
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/mpeterv/argparse/archive/${pkgver}.tar.gz")
md5sums=('596c66ea5573a23c8e13f6f4b02fa0f1')

package() {
  cd "${srcdir}/${_lua_name}-$pkgver"
  install -Dm644 src/argparse.lua \
    "${pkgdir}/usr/share/lua/5.3/argparse.lua"

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
