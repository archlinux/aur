#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-luacheck
pkgver=0.20.0
_rockname=luacheck
_rockrel=1
pkgrel=1
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
depends=('lua' 'lua-filesystem')
makedepends=('luarocks5.1')
conflicts=()
source=("https://luarocks.org/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('a23664b495f14ddb81d6e2bb35fea02885130751de4fc6f8e341fcc79b82be11')

package() {
    luarocks --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
      find "$pkgdir/usr" -name manifest -delete

}

