# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-rocketarena
pkgver=1.80
pkgrel=1
pkgdesc="Rocket Arena is a modification for Quake 3 where players compete in multiple arenas tournament style."
url="http://rocketarena.planetquake.gamespy.com/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://games.mirrors.tds.net/pub/planetquake3/modifications/rocketarena3/ra3180.zip')
md5sums=('68e9ac4f5571d85c963e985193c16230')

build() {
    # Create Destination Directories
    install -d $startdir/pkg/opt/quake3/

    # Delete Useless Files

    # Install RA3 Files
    cp -r $startdir/src/arena \
        $startdir/pkg/opt/quake3/
}
