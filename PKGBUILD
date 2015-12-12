 # Maintainer: Elrondo46 <elrond94@hotmail.com> 
pkgname=i686-doomsday2-unstable
pkgver=2.0.0
pkgrel=1
_build=1805
pkgdesc="The advanced Doom engine in version 2x that supports DOOM, Heretic and Hexen but not finalized."
url="http://dengine.net/"
arch=('i686')
license=('GPL2')
conflicts=('doomsday2-unstable')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'assimp')
makedepends=('imagemagick')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("http://netcologne.dl.sourceforge.net/project/deng/Doomsday Engine/Builds/doomsday_${pkgver}-build${_build}_i386.deb")
md5sums=('66f414962b1782fb5598bbd9fc3850c4')

package() {
	cd "$srcdir"
	tar xvzf data.tar.gz -C $pkgdir
	install -d $pkgdir/usr/
}
