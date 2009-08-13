# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-excessiveplus
pkgver=1.03
pkgrel=1
pkgdesc="Excessive Plus is a modification for Quake 3 where all weapons are 'excessive'."
url="http://www.excessiveplus.net/"
license=""
depends=('quake3')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=('http://www.excessiveplus.net/downloads/xp-1.03-full.zip')
md5sums=('878cf3994734e790dc6c98354d1fa3e5')

build() {
	cd $startdir/src/

	# Base Excessive Plus Files
	install -d $startdir/pkg/opt/quake3/
	unzip xp-1.03-full.zip -d $startdir/pkg/opt/quake3/

	# Cleanup unneeded files
	cd $startdir/pkg/opt/quake3/
	rm xp_dedicated.bat xp_server.bat xp_singleplayer.bat
	cd excessiveplus/
	rm -r tools/
}
