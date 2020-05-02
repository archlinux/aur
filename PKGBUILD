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
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("gameforge.install"
		"gameforge.png"
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
	install -d $pkgdir$HOME/.gameforge
	cp gameforge.sh $pkgdir/usr/bin/
	mv $pkgdir/usr/bin/gameforge.sh $pkgdir/usr/bin/gameforge
	cp gameforge.png $pkgdir/usr/share/icons
	cp gameforge.desktop $pkgdir/usr/share/applications
}
md5sums=('d04f75b2287319dae2838b00df82faa3'
         '0db6b822bbdf443247671e1d93216b1a'
         'e693c79d27d45e1971529bb3841fdb48'
         '42ca039defd945472b82d881bd7847c1')
