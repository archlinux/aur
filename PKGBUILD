# Contributor: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake-rocketarena
pkgver=1.2
pkgrel=3
pkgdesc="The popular Rocket Arena modification for QuakeWorld"
url="http://rocketarena.planetquake.gamespy.com/"
arch=('any')
license=('custom')
depends=('quake')
install=
source=('http://www.quaddicted.com/webarchive/ftp.telefragged.com/quake/rocketarena/farena12.zip')
md5sums=('6447224a2ac55cefa8a04e6b70888cd7')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d ${pkgdir}/opt/quake/arena/

    # Move RA Data File
    install -Dm644 ${srcdir}/pak0.pak \
        ${pkgdir}/opt/quake/arena/pak0.pak

    # Move RA Readme
    install -Dm644 ${srcdir}/readme.txt \
        ${pkgdir}/opt/quake/arena/readme.txt
}
