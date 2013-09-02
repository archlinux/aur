# Maintainer: Slash <demodevil5[at]yahoo[dot]com>

pkgname=quake3-urbanterror
pkgver=4.2.014
pkgrel=1
pkgdesc="Urban Terror is a team-based tactical shooter based on the Quake 3 Engine (Quake3 Mod Version)"
url="http://www.urbanterror.info/"
license=('custom')
arch=('any')
depends=('quake3')
source=('http://cdn.urbanterror.info/urt/42/zips/UrbanTerror42_full014.zip')
sha256sums=('52618f40223baedf37b0a97fc99fd05d3915d20eaff38c71e4eeb66835c7d169')
PKGEXT='.pkg.tar'

package() {
    # Create Destination Directory
    install -d ${pkgdir}/opt/quake3/

    # Base UT Files
    mv ${srcdir}/UrbanTerror42/q3ut4 ${pkgdir}/opt/quake3/

    # Install License/Readme File
    install -D -m644 ${pkgdir}/opt/quake3/q3ut4/readme42.txt \
        ${pkgdir}/usr/share/licenses/${pkgname}/readme42.txt
}
