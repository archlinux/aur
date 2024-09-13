# Maintainer: Marcin Nowak <marcin.j.nowak@gmail.com>

pkgname=ufraw-thumbnailer
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="Provides thumbnailer definition to generate thumbnails for RAW images in file managers like Nautilus or Nemo"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('gimp-nufraw')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("Makefile" "ufraw.thumbnailer")
noextract=()
md5sums=('bb7b2a9549d5d53f21305258e2fcf262'
         '52989011d14890d8f775b41992200369')
validpgpkeys=()

package() {
	make DESTDIR="$pkgdir/" install
}
