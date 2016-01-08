# Maintainer: Marcin Nowak <marcin.j.nowak@gmail.com>

pkgname=ufraw-thumbnailer
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="Provides thumbnailer definition to generate thumbnails for RAW images in file managers like Nautilus or Nemo"
arch=('any')
url=""
license=('GPL')
groups=()
depends=('gimp-ufraw')
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
         '1710c4432acd8d7a487339c20ce93dbd')
validpgpkeys=()

package() {
	make DESTDIR="$pkgdir/" install
}
