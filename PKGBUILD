# Maintainer: Marcin Nowak <marcin.j.nowak@gmail.com>

pkgname=ufraw-thumbnailer
pkgver=0.2
pkgrel=2
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
         'de62d9b3b4b79423c7258e549d280936')
validpgpkeys=()

package() {
	make DESTDIR="$pkgdir/" install
}
