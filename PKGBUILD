# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-excessiveplus
pkgver=2.0a
pkgrel=1
pkgdesc="Excessive Plus is a modification for Quake 3 where all weapons are 'excessive'."
url="http://www.excessiveplus.net/"
arch=('i686' 'x86_64')
license=('custom')
depends=('quake3')
source=("http://www.excessiveplus.net/files/release/xp-${pkgver}.zip")
md5sums=('234052d4ee31b0871cb8b1d9a896d1b2')

build() {
	cd $srcdir

	# Base Excessive Plus Files
	install -d $pkgdir/opt/quake3/
	unzip xp-${pkgver}.zip -d $pkgdir/opt/quake3/

	# Cleanup unneeded files
	cd $pkgdir/opt/quake3/
	rm xp_dedicated.bat xp_server.bat xp_singleplayer.bat
	cd excessiveplus/
	rm -r tools/
}
