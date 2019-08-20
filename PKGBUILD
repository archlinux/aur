# Maintainer: robertfoster

pkgname=iortcw-venom-mod
pkgver=6.5
pkgrel=1
pkgdesc="Venom Mod is a general improvement of original Rtcw game, with a new challenging and aggressive AI and some exploitation of features of id tech 3 engine, keeping the original gameplay"
arch=(any)
url="https://www.moddb.com/mods/rtcw-venom-mod"
license=('CUSTOM')
depends=('iortcw-git')
makedepends=('unrar')
noextract=("Venom Mod v$pkgver.zip")
source=("http://www.wolfenstein-files.de/rtcw/single/Venom Mod v$pkgver.zip")

package() {
	cd "$srcdir"
	unzip -j -o "Venom Mod v$pkgver.zip"
	for i in $(ls *.pk3); do
		install -Dm755 $i $pkgdir/opt/iortcw/Venom\ Mod/$i
	done
	install -Dm755 autoexec.cfg $pkgdir/opt/iortcw/Venom\ Mod/autoexec.cfg
}

md5sums=('545a7427b639a7dfecaf13dec7d9772d')
