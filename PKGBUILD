#Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=lua51-say
pkgver=1.3
_pkgname=say
pkgrel=4
pkgdesc="A simple static analyzer"
arch=('i686' 'x86_64')
url="https://github.com/Olivine-Labs/say"
license=('MIT')
depends=('lua51' 'lua51-filesystem')
conflicts=()
source=("git+https://github.com/Olivine-Labs/say#commit=7f30493f602bf8b97332c3faf94e824eb1c4ea2f")
sha256sums=('SKIP')

package() {
cd ${srcdir}/$_pkgname
install -D $srcdir/$_pkgname/src/init.lua $pkgdir/usr/share/lua/5.1/say/init.lua
}

