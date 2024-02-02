# Maintainer: Popolon <popolon@popolon.org>

pkgbase=lua-timerwheel
pkgname=(lua-timerwheel lua51-timerwheel lua52-timerwheel lua53-timerwheel)
_rockname=${pkgname#lua-}
pkgver=1.0.2
_rockrel=${pkgver//.*}
pkgrel=1
pkgdesc='File System Library for the Lua Programming Language'
arch=('x86_64')
url='https://tieske.github.io/timerwheel.lua/'
license=('MIT')
makedepends=('lua' 'lua51' 'lua52' 'lua53' 'luarocks')
source=("$pkgbase-${pkgver}.tar.gz::https://github.com/Tieske/timerwheel.lua/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a3d0159bcf996f3c73ac20d6168d2aaedcd6877df8f7ae6a1994010ad8492784')

package_lua-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.4'
  cd timerwheel.lua-${pkgver}
  luarocks install --lua-version=5.4 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua51-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.1'
  cd timerwheel.lua-${pkgver}
  luarocks install --lua-version=5.1 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua52-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.2'
  cd timerwheel.lua-${pkgver}
  luarocks install --lua-version=5.2 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}

package_lua53-timerwheel() {
  pkgdesc='Timer wheel implementation for Lua 5.3'
  cd timerwheel.lua-${pkgver}
  luarocks install --lua-version=5.3 --tree="$pkgdir/usr/" --deps-mode=none --no-manifest "rockspecs/$_rockname-$pkgver-$_rockrel.rockspec"
}
