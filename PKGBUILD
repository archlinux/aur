# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=('lua-ansicolors' 'lua51-ansicolors' 'lua52-ansicolors')
pkgver=1.0.2
pkgrel=1
pkgdesc="ANSI terminal color manipulation for Lua"
arch=('x86_64')
url='https://github.com/kikito/ansicolors.lua'
license=('MIT')
source=("https://github.com/kikito/ansicolors.lua/archive/v1.0.2.tar.gz")
sha256sums=('fa76a465c2e0d342f6d5a1d44c63bd398053f206f41c7b5356b551694f899d64')

package_lua-ansicolors() {
  pkgdesc='ANSI terminal color manipulation for Lua 5.3'
  install -Dm644 "${srcdir}/ansicolors.lua-${pkgver}/ansicolors.lua" \
   -t "${pkgdir}/usr/share/lua/5.3/"
}

package_lua51-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.1'
  install -Dm644 "${srcdir}/ansicolors.lua-${pkgver}/ansicolors.lua" \
   -t "${pkgdir}/usr/share/lua/5.1/"
}

package_lua52-ansicolors() {
  pkgdesc='ANSI terminal color manipulation module for Lua 5.2'
  install -Dm644 "${srcdir}/ansicolors.lua-${pkgver}/ansicolors.lua" \
   -t "${pkgdir}/usr/share/lua/5.2/"
}