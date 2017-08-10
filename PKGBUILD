#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-say
pkgver=1.3
_rockname=say
_rockrel=1
pkgrel=1
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/mpeterv/luacheck"
license=('MIT')
depends=('lua' 'lua-filesystem')
makedepends=('luarocks5.1')
conflicts=()
source=("https://luarocks.org/manifests/olivine-labs/${_rockname}-${pkgver}-${_rockrel}.rockspec")
sha256sums=('bbc1d5bf43620daad2d3a355822709ad77f1cd62705c3ec0c9a6710c167d762e')

package() {
    luarocks-5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.rockspec"
      find "$pkgdir/usr" -name manifest -delete

}

