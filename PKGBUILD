# Maintainer: Caleb Maclennan <caleb@alerque.com>

_rockname=cassowary
pkgname=lua-$_rockname
pkgver=2.2
_rockrel=0
pkgrel=2
pkgdesc="The cassowary constraint solver."
arch=('i686' 'x86_64')
url="https://github.com/simoncozens/cassowary.lua"
license=('MIT')
depends=('lua' 'lua-penlight')
makedepends=('luarocks')
conflicts=()
source=("https://github.com/simoncozens/$_rockname.lua/archive/v$pkgver.tar.gz")
sha256sums=('e2f7774b6883581491b8f2c9d1655b2136bc24d837a9e43f515590a766ec4afd')

package() {
    cd "$_rockname.lua-$pkgver"
    install -Dm 644 $_rockname.lua -t "$pkgdir/usr/share/lua/5.3"
}
