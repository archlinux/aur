pkgname=gameforge
pkgver=1.10
pkgrel=1
epoch=
pkgdesc="GameForge (WINE)"
arch=(x86_64)
url="https://gameforge.com"
license=('GPL')
groups=()
depends=('wine-staging' 'winetricks')
makedepends=()
checkdepends=()
optdepends=('wine-nine')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("gameforge.png"
		"gameforge.desktop"
		"gameforge.sh")
noextract=()
validpgpkeys=()

prepare() {
	echo $srcdir
}

build() {
	echo no build
}

check() {
	echo no check
}

package() {
	cd $srcdir
	install -d $pkgdir/usr/bin
	install -d $pkgdir/usr/share/icons
	install -d $pkgdir/usr/share/applications
	install -d $pkgdir/usr/share/applications
	cp gameforge.sh $pkgdir/usr/bin/
	mv $pkgdir/usr/bin/gameforge.sh $pkgdir/usr/bin/gameforge
	cp gameforge.png $pkgdir/usr/share/icons
	cp gameforge.desktop $pkgdir/usr/share/applications
}
md5sums=('0db6b822bbdf443247671e1d93216b1a'
         'e693c79d27d45e1971529bb3841fdb48'
         '5faf6c868c8cb572ae03ed06d263614a')
