# Maintainer: Ludvig Holtze <ludvighg1999 at gmail dot com>

pkgname=quake3-freezetag
pkgver=1.51b
pkgrel=1
pkgdesc="A modification for Quake III Arena implementing that game you may have played as a kid"
url="https://web.archive.org/web/20090410063054/http://freeze.planetquake.gamespy.com:80/"
license=('custom')
arch=('any')
depends=('quake3')
source=('https://mirrorservice.org/sites/quakeunity.com/modifications/freezetag/q3freeze151b.zip')
sha256sums=('992ceca27b740ad6048403e24dd212bf56d49c60d7a2b5821fb0ca690712e69b')

package() {
    # Create destination directory
    install -d "${pkgdir}/opt/quake3/freeze"

    # Install files
    cp -r "${srcdir}/freeze" "${pkgdir}/opt/quake3/"

    # Remove unneccessary files
    cd "${pkgdir}/opt/quake3/freeze"
   	rm "Freeze Tag.lnk" ft.bat
		cd "${pkgdir}/opt/quake3/freeze/missionpack"
		rm "Freeze Tag.lnk" ft.bat
}
