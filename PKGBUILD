#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-say
pkgver=1.3
_rockname=say
_rockrel=1
pkgrel=3
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/Olivine-Labs/say"
license=('MIT')
depends=('lua' 'lua-filesystem')
makedepends=('luarocks5.1')
conflicts=()
source=("git+https://github.com/Olivine-Labs/say#commit=7f30493f602bf8b97332c3faf94e824eb1c4ea2f")
sha256sums=('SKIP')

package() {
	cd "say"
    luarocks-5.1 --tree="$pkgdir/usr" install --deps-mode=none "${_rockname}-${pkgver}-${_rockrel}.rockspec"
      find "$pkgdir/usr" -name manifest -delete

}

