# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-rocketarena
pkgver=1.2
pkgrel=1
pkgdesc="The popular Rocket Arena modification for QuakeWorld"
url="http://rocketarena.planetquake.gamespy.com/"
license=""
depends=('ezquake')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=('http://quake.addicts.nl/files/farena12.zip')
md5sums=('6447224a2ac55cefa8a04e6b70888cd7')

build() {
	cd $startdir/src/

	# Base RA Files	
	install -d $startdir/pkg/opt/quake/arena/
	unzip -L farena12.zip -d $startdir/pkg/opt/quake/arena/
}
