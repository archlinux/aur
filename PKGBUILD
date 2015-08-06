# Maintainer: Jan-Jaap Korpershoek (JJK) <jjkorpershoek96@gmail.com> 
pkgname=sonic3d
pkgver=0.3
pkgrel=1
pkgdesc="3D fan game starring Sonic the Hedgehog on EDuke32 engine"
arch=(x86_64 i686)
url="http://www.indiedb.com/games/sonic-the-hedgehog-3d"
license=('GPL')
depends=(libvpx libpng12 sdl_mixer)
optdepends=(timidity++)
conflicts=()
replaces=()
backup=()
options=()
noextract=()
source_x86_64=("http://www.indiedb.com/downloads/mirror/53313/107/02419bfb40ba8585ce7c38c608058186")
source_i686=("http://www.indiedb.com/downloads/mirror/53311/102/5906f387f6f687639eaae117c53ecec0")
md5sums_x86_64=(85263704c023a8de04a2c1a81d3131dd)
md5sums_i686=(d5176fec59c7386a6e181abaacba7d6e)

package() {
	cd "$srcdir"
	tar xvzf data.tar.gz -C $pkgdir
	install -d $pkgdir/usr/bin/
	install $pkgdir/usr/games/* $pkgdir/usr/bin
	rm -r $pkgdir/usr/games
}
