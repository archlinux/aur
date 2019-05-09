# Maintainer: SolarAquarion <shlomochoina@gmail.com>

pkgname=lua51-luassert
pkgver=1.7.11
pkgrel=1
_rockname=luassert
pkgdesc="Assertion library for Lua"
arch=('i686' 'x86_64')
url="https://github.com/Olivine-Labs/luassert"
license=('MIT')
depends=('lua51-say' 'lua51' 'lua51-filesystem')
conflicts=()
source=("https://github.com/Olivine-Labs/luassert/archive/v${pkgver}.tar.gz")
sha256sums=('6a8ed5b6af976d144d02c98e0d0814993e76a147c3066769fa5eb224311f98ef')

package() {
  cd "$_rockname-$pkgver"
  mkdir -p $pkgdir/usr/share/lua/5.1/luassert
  cp -r src/* $pkgdir/usr/share/lua/5.1/luassert
}
