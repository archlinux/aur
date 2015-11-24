# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=luacheck
pkgver=0.12.0
pkgrel=1
pkgdesc="A tool for linting and static analysis of Lua code."
arch=('any')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
depends=('lua')
source=("https://github.com/mpeterv/$pkgname/archive/$pkgver.tar.gz"
        "luacheck")
sha256sums=('3f8306f5210eeac7dd3057cff7924b487229ebc15a595c0767715d3e4c300e47'
            '5bbc0a1be3684c2691cf34aea8bc5538d819e3591ec3ec363bf4a911f53c8f78')

package() {
  install -Dm755 luacheck "$pkgdir/usr/bin/luacheck"

  cd "$pkgname-$pkgver"
  lua install.lua "$pkgdir/usr/share/luacheck"
}

# vim:set ts=2 sw=2 et:

