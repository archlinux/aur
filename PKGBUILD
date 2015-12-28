 # Maintainer: Elrondo46 <elrond94@hotmail.com> 
pkgname=doomsday2-unstable
pkgver=2.0.0
pkgrel=3
_build=1821
pkgdesc="The advanced Doom engine in version 2x that supports DOOM, Heretic and Hexen but not finalized."
url="http://dengine.net/"
arch=('x86_64')
license=('GPL2')
conflicts=('i686-doomsday2-unstable' 'doomsday')
depends=('qt5-base' 'qt5-x11extras' 'sdl2_net' 'sdl2_mixer' 'fmodex' 'wxpython' 'assimp')
makedepends=('imagemagick')
optdepends=('doom1-wad: Doom shareware', 
            'heretic1-wad: Heretic shareware', 
            'hexen1-wad: Hexen shareware')
source=("http://netcologne.dl.sourceforge.net/project/deng/Doomsday Engine/Builds/doomsday_${pkgver}-build${_build}_amd64.deb")
md5sums=('79d419cdb27b9cb3330ab80ceabe98d6')

package() {
	cd "$srcdir"
	tar xvzf data.tar.gz -C $pkgdir
	install -d $pkgdir/usr/
	rm -r $pkgdir/usr/include/assimp
}
