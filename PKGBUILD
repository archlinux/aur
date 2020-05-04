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
		"gameforge.sh"
		"https://install.gameforge.com/download?download_id=95a5f799-9507-4dba-88fb-7d1da580e1a2&game_id=df8661d6-a76e-417f-82dc-9fada569615e&locale=fr")
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
	install -d $pkgdir$HOME/.gameforge/wine
	cp gameforge.sh $pkgdir/usr/bin/
	mv $pkgdir/usr/bin/gameforge.sh $pkgdir/usr/bin/gameforge
	cp download\?download_id=95a5f799-9507-4dba-88fb-7d1da580e1a2\&game_id=df8661d6-a76e-417f-82dc-9fada569615e\&locale=fr $pkgdir/$HOME/.gameforge/wine/GameForgeInstaller.exe
	cp gameforge.png $pkgdir/usr/share/icons
	cp gameforge.desktop $pkgdir/usr/share/applications
}
md5sums=('0db6b822bbdf443247671e1d93216b1a'
         'e693c79d27d45e1971529bb3841fdb48'
         '9c43a87b298d82122b30f4c2b19e3607'
         'e54fe71bf5108643d365b8d0c51e4c67')
