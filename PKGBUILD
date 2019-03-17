# Xabre <Xabre@archlinux.info>

pkgname=lua-yajl
pkgver=2.0
_rockname=lua-yajl
_rockrel=1
pkgrel=2
pkgdesc="Integrate the yajl JSON library with Lua."
arch=('i686' 'x86_64')
url="https://luarocks.org/modules/brimworks/lua-yajl"
license=('GPL')
depends=('lua51' 'yajl')
makedepends=('luarocks')
conflicts=()
source=("https://luarocks.org/manifests/brimworks/${_rockname}-${pkgver}-${_rockrel}.src.rock")
sha256sums=('8e5c5bde4ae4aac336c5ce6da2aef94bf4f69f37e921d718647914bd5328552f')

package() {
  luarocks --lua-version=5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.src.rock"
  find "$pkgdir/usr" -name manifest -delete
}

