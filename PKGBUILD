# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.1.1
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.net/"
license=('freeware')
arch=('i686' 'x86_64')
depends=('quake3' 'curl')
makedepends=('unzip')
source=('ftp://ftp.snt.utwente.nl/pub/games/urbanterror/full_install/linux_or_mac/UrbanTerror411.zip')
md5sums=('722c1fea9936593c9ef039bb068cc33b')

build() {
    cd $srcdir

    # Base UT Files
    install -d $pkgdir/opt/quake3/
    mv $srcdir/UrbanTerror/q3ut4 $pkgdir/opt/quake3/

    # Clean Up
    cd $pkgdir/opt/quake3/q3ut4/
    rm *.url
}
