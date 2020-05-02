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
	cp gameforge.png $HOME/.local/share/icons/hicolor/256x256/apps
	cp gameforge.desktop $HOME/.local/share/applications
}

build() {
	echo no build
}

check() {
	echo no check
}

package() {
	cd $srcdir
	mkdir $pkgdir/usr/
	mkdir $pkgdir/usr/bin
	cp gameforge.sh $pkgdir/usr/bin/
	mv $pkgdir/usr/bin/gameforge.sh $pkgdir/usr/bin/gameforge
}
md5sums=('d04f75b2287319dae2838b00df82faa3'
         '0db6b822bbdf443247671e1d93216b1a'
         'fdfb4d34c3e793ed6fdf17f3b54eea20'
         '27adb540c2f7910b34978b03449bf995')
