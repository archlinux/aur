# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.1
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.net/"
license=('freeware')
arch=('i686' 'x64_64')
depends=('quake3' 'curl')
makedepends=('unzip')
source=('ftp://ftp.snt.utwente.nl/pub/games/urbanterror/UrbanTerror_41_FULL.zip')
md5sums=('1370306ea236f65f595e7ca70765e469')

build() {
    cd $startdir/src/

    # Base UT Files	
    install -d $startdir/pkg/opt/quake3/
    mv $startdir/src/UrbanTerror/q3ut4 $startdir/pkg/opt/quake3/

    # Clean Up
    cd $startdir/pkg/opt/quake3/q3ut4/
    rm *.url 
}
