# Maintainer: Popolon <popolon@popolon.org>

pkgbase=lua-timerwheel
pkgname=(lua-timerwheel lua51-timerwheel lua52-timerwheel lua53-timerwheel)
pkgver=0.2.0
pkgrel=1
pkgdesc='File System Library for the Lua Programming Language'
arch=('x86_64')
url='https://tieske.github.io/timerwheel.lua/'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53')
source=("$pkgbase-${pkgver}.tar.gz::https://github.com/Tieske/timerwheel.lua/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b81250f0ea0e2eebecd995180906c883e0d70f3f43aef3b7bfd24b9cd5f77a22')

package_lua-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.4'
  cd timerwheel.lua-${pkgver}
  install -Dm644 src/timerwheel.lua "$pkgdir/usr/share/lua/5.4/timerwheel.lua"
}

package_lua51-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.1'
  cd timerwheel.lua-${pkgver}
  install -Dm644 src/timerwheel.lua "$pkgdir/usr/share/lua/5.1/timerwheel.lua"
}

package_lua52-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.2'
  cd timerwheel.lua-${pkgver}
  install -Dm644 src/timerwheel.lua "$pkgdir/usr/share/lua/5.2/timerwheel.lua"
}

package_lua53-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.3'
  cd timerwheel.lua-${pkgver}
  install -Dm644 src/timerwheel.lua "$pkgdir/usr/share/lua/5.3/timerwheel.lua"
}
